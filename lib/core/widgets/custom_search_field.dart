import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/l10n.dart';
import '../theme/app_color.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search) ,
        suffixIcon: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SvgPicture.asset("assets/icons/filter.svg",),
        ),
        hintText: S.of(context).searchFor,
        hintStyle: AppTextStyle.search16 ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.outLineColor),
          borderRadius: BorderRadius.circular(20.r),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),

    );;
  }
}
