import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class CardItemAllCategory extends StatelessWidget {
  final HomeCategoryModel category ;
  const CardItemAllCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: AppColor.customElevated,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(category.image, fit: BoxFit.contain),
            Text(
              category.title,
              style: AppTextStyle.font20black.copyWith(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            Icon(Icons.arrow_right, size: 50, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
