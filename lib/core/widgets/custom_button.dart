import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title ;
  final IconData? icon ;
  final double? width ;


  const CustomButton({super.key, required this.title, this.icon, this.width, });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB140C5),
            Color(0xFF007AFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child:
            Text(title,style: AppTextStyle.font20White),



      ),
    );
  }
}
