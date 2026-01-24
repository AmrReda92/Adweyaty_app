import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class OrdersRepo {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference getOrdersRef(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("orders");
  }

  Future<void> createOrder({
    required String uid,
    required OrderModel order,
  }) async {
    await getOrdersRef(uid).doc(order.id).set(order.toJson());
  }

  Stream<List<OrderModel>> getOrders(String uid) {
    return getOrdersRef(uid)
        .orderBy("date", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel.fromJson(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
}
