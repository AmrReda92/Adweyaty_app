import 'package:adweyaty_application/core/theme/app_color.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.boarderColor),
          borderRadius: BorderRadius.circular(8),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

    );
  }
}
