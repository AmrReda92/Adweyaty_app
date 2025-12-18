class DrugItemDetails {
  final String id ;
  final String image ;
  final String name ;
  final double  price ;
  final String  categoryId ;

  DrugItemDetails(
      {
        required this.categoryId,
        required this.id,
        required this.price,
        required this.name,
        required this.image
      }
  );

  factory DrugItemDetails.fromJson(Map<String,dynamic>json ,String docId ){
    return DrugItemDetails(
        categoryId: json["categoryId"],
        id: docId,
        price: (json["price"]as num).toDouble(),
        name: json["name"],
        image: json["image"]
    );
  }
}




