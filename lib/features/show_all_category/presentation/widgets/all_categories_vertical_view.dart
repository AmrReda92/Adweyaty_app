import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:adweyaty_application/features/show_all_category/presentation/widgets/card_item_all_category.dart';
import 'package:flutter/material.dart';



class AllCategoriesVerticalView extends StatelessWidget {
  const AllCategoriesVerticalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeCategoryModel.length,
        itemBuilder: (context,index){
          final item = homeCategoryModel[index];
          return CardItemAllCategory(category: item);
        }
    );
  }
}
