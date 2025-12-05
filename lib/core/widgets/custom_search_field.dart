import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_color.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search) ,
        suffixIcon: SvgPicture.asset("assets/icons/filter.svg"),
        hintText: "Search for....." ,
        hintStyle: AppTextStyle.search16 ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.boarderColor),
          borderRadius: BorderRadius.circular(8),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

    );;
  }
}
