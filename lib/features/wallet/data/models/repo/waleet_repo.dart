import 'package:cloud_firestore/cloud_firestore.dart';

class WalletRepo {
  final _firestore = FirebaseFirestore.instance;

  DocumentReference getWalletRef(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("wallet")
        .doc("main");
  }

  CollectionReference getTransactionsRef(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("wallet_transactions");
  }

  // جلب الرصيد
  Stream<num> getBalance(String uid) {
    return getWalletRef(uid).snapshots().map((doc) {
      final data = doc.data() as Map<String, dynamic>?;
      return data?['balance'] ?? 0;
    });
  }

  Future<void> addBalance({
    required String uid,
    required num amount,
  }) async {
    final walletRef = getWalletRef(uid);
    final txRef = getTransactionsRef(uid);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(walletRef);

      num currentBalance = 0;
      if (snapshot.exists) {
        currentBalance = snapshot['balance'] ?? 0;
      }

      final newBalance = currentBalance + amount;

      // تحديث الرصيد
      transaction.set(walletRef, {
        'balance': newBalance,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // تسجيل العملية
      transaction.set(txRef.doc(), {
        'type': 'add',
        'amount': amount,
        'date': FieldValue.serverTimestamp(),
      });
    });
  }

  Future<void> spendBalance({
    required String uid,
    required num amount,
  }) async {
    final walletRef = getWalletRef(uid);
    final txRef = getTransactionsRef(uid);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(walletRef);

      num currentBalance = snapshot['balance'] ?? 0;

      if (currentBalance < amount) {
        throw Exception("Not enough balance");
      }

      final newBalance = currentBalance - amount;

      // تحديث الرصيد
      transaction.set(walletRef, {
        'balance': newBalance,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // تسجيل العملية
      transaction.set(txRef.doc(), {
        'type': 'spend',
        'amount': amount,
        'date': FieldValue.serverTimestamp(),
      });
    });
  }


}