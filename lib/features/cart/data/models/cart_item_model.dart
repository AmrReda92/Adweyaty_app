import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  final String productId ;
  final  String name;
  final String image;
  final num price;
  final num quantity;
  final Timestamp? addedAt;

  CartItemModel( {required this.productId,
    required this.name,
    required this.image,
    required this.price,
    this.quantity=1,
    this.addedAt,
  });

  Map<String,dynamic> toJson(){
    return {
      "productId" : productId,
      "name" : name,
      "image" : image,
      "price" : price,
      "quantity" : quantity,
      "addedAt" : addedAt ?? FieldValue.serverTimestamp()
    };
  }

  factory CartItemModel.fromJson (Map<String,dynamic> json){
    return CartItemModel(
      productId: json["productId"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
       addedAt: json["addedAt"],
    );
  }

  CartItemModel copyWith ({num? quantity }){
   return CartItemModel(
       productId: productId,
       name: name,
       image: image,
       price: price,
     quantity: quantity ?? this.quantity,
     addedAt: addedAt
   );
  }
}
