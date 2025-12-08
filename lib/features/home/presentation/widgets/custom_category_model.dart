import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/homeCategoryModel.dart';

class CustomCategoryModel extends StatelessWidget {
  final HomeCategoryModel category ;


  const CustomCategoryModel({super.key, required this.category,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 180.h,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(image: AssetImage(category.image),fit: BoxFit.cover)
          ),
        ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(category.title,style: AppTextStyle.font20black.copyWith(fontSize: 18),textAlign: TextAlign.center,))
      ],

    );
  }
}
