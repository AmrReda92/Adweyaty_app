
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:adweyaty_application/features/home/presentation/widgets/custom_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_images/app_images.dart';

class GridViewHorizontalItems extends StatelessWidget {
  const GridViewHorizontalItems({super.key,});

  static final List<HomeCategoryModel> categories =
  [
    HomeCategoryModel(id:"1",image: AppImages.bloodPressure,title: "pressure medicines"),
    HomeCategoryModel(id:"2",image: AppImages.coughMedicines, title: "cough medicines"),
    HomeCategoryModel(id:"3",image: AppImages.headache, title: "headache medicines"),
    HomeCategoryModel(id:"4",image: AppImages.temperature, title: "temperature medicines"),
    HomeCategoryModel(id:"5",image: AppImages.womanProduct, title: "woman medicines"),
    HomeCategoryModel(id:"6",image: AppImages.vitamin, title: "vitamin medicines"),
  ];

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
          itemCount: categories.length,
          itemBuilder: (context,index) {
            final category = categories[index];
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
