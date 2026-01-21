import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteItemModel {
  final String productId;
  final String name;
  final String image;
  final num price;
  final Timestamp? addedAt;

  FavouriteItemModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    this.addedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "name": name,
      "image": image,
      "price": price,
      "addedAt": addedAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory FavouriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavouriteItemModel(
      productId: json["productId"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      addedAt: json["addedAt"],
    );
  }
}
