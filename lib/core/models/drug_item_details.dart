class DrugItemDetails {
  final String image ;
  final String name ;
  final String price ;

  DrugItemDetails({required this.price,required this.name,required this.image});
}

final Map <String,List<DrugItemDetails>> productByCategory =
{
  "0":
  [

    DrugItemDetails(
        price: "20",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "40",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "60",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "80",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "100",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
  ],

  "1" :
  [
    DrugItemDetails(
        price: "20",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "40",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "60",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "80",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
    DrugItemDetails(
        price: "100",
        name: "panadol tablets",
        image: "assets/images/panadol.png"
    ),
  ]

}
;