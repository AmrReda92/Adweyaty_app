import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepo {
  final FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;

  Future<void> AddToCart ({required uid ,required CartItemModel item})async{

    // نحدد مكان الكارت في Firestore
    final docRef = _firebaseFirestore.
    collection("users").
    doc(uid).
    collection("cart").
    doc(item.productId);

    // نشوف المنتج موجود ولا لأ
    final doc = await docRef.get();

    if(doc.exists){
      await docRef.update(
        {
          "quantity": FieldValue.increment(1)
        }
      );
      // لو مش موجود
      // نحفظه بكل بياناته
    }else{
      await docRef.set(item.toJson());
    }

  }

  Stream<List<CartItemModel>> getCartItems(String uid) {
    return _firebaseFirestore.
    collection("users").
    doc(uid).
    collection("cart").
    orderBy("addedAt",descending: true).
    snapshots().
    map((snapshots) {
      List<CartItemModel> items =[];

      for(var doc in snapshots.docs){
        final item = CartItemModel.fromJson(doc.data());
        items.add(item);
      }
      return items;
    });
  }

  Future<void> updateQuantity ({
    required String uid,
    required String productId,
    required num quantity,
})async {
    final docRef = _firebaseFirestore.
    collection("users").
    doc(uid).
    collection("cart").
    doc(productId);

    if(quantity<=0){
      await docRef.delete();
    }else{
      await docRef.update({"quantity": quantity});
    }
  }

  Future<void> removeFromCart ({required uid,required productId})async{
    await _firebaseFirestore.
    collection("users").
    doc(uid).
    collection("cart").
    doc(productId).delete();
  }

  Future<void> clearFromCart (String uid)async{
    final cartRef =  _firebaseFirestore.
    collection("users").doc(uid).collection("cart");

    final snapshots = await cartRef.get();

    for(var item in snapshots.docs){
      await item.reference.delete();
    }
  }

  Future<List<CartItemModel>> getCartOnce(String uid) async {
    final snap = await _firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .get();

    return snap.docs
        .map((doc) => CartItemModel.fromJson(doc.data()))
        .toList();
  }

}