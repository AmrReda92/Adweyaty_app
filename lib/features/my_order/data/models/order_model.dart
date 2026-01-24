import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final num totalPrice;
  final Timestamp date;
  final String id;
  final String status;
  final List<CartItemModel> items ;

  OrderModel({
  required this.items,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "totalPrice": totalPrice,
      "status": status,
      "date": date,
      "items": items.map((e) => e.toJson()).toList(),
    };
  }


  factory OrderModel.fromJson(String id,Map<String,dynamic> json){
    return OrderModel(
        items: (json["items"] as List)
            .map((e) => CartItemModel.fromJson(e))
            .toList(),
        totalPrice:json["totalPrice"],
        date:json["addedAt"],
        id: id,
        status: json["status"],
    );
  }
}
