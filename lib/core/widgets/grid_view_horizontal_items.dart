
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:adweyaty_application/features/home/presentation/widgets/custom_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewHorizontalItems extends StatelessWidget {
  const GridViewHorizontalItems({super.key,});

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: .34.sh,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: .85,
          ),
          itemCount: homeCategoryModel.length,
          itemBuilder: (context,index) {
            final category = homeCategoryModel[index];
            return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Routes.productScreen ,arguments: category);
                },
                child: CustomCategoryModel(category: category));
          }
      ),
    );
  }
}
