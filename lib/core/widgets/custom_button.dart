import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title ;
  const CustomButton({super.key, required this.title,   });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(title,style: AppTextStyle.font20),
      ),
    );
  }
}
