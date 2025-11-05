import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  static final List<HomeCategoryModel> categories =
  [
    HomeCategoryModel(image: AppImages.bloodPressure,title: "pressure medicines"),
    HomeCategoryModel(image: AppImages.coughPerson, title: "cough medicines"),
    HomeCategoryModel(image: AppImages.headache, title: "headache medicines"),
    HomeCategoryModel(image: AppImages.temperature, title: "temperature medicines"),
    HomeCategoryModel(image: AppImages.womanProduct, title: "woman medicines"),
    HomeCategoryModel(image: AppImages.vitamin, title: "vitamin medicines"),
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
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context,index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  child: Container(
                    height: 180.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(image: AssetImage(categories[index].image),fit: BoxFit.cover)
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child: Text(categories[index].title,style: AppTextStyle.font20.copyWith(fontSize: 18),textAlign: TextAlign.center,))
              ],

            );

          }
      ),
    );
  }
}
