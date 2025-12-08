import 'package:adweyaty_application/core/models/drug_item_details.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/medicine_details_card.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductScreen extends StatelessWidget {
  final HomeCategoryModel categoryProduct;
  const ProductScreen({super.key, required this.categoryProduct});

  static Map <String,List<DrugItemDetails>> productByCategory =
  {
    "1":
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

   "2" :
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

  @override
  Widget build(BuildContext context) {
    final products = productByCategory[categoryProduct.id]??[];
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: CustomAppbarCategory(title: "Cough Medicines"),
        body: products.isEmpty
            ? const Center(child: Text("No products for this category yet"))
            : GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: .75
            ),
            itemCount: products.length,
            itemBuilder: (context,index){
                 final item =products[index];
                 return MedicineDetailsCard(drugItem: item);
            }

        )


    );
  }
}
