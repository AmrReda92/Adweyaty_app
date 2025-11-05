import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title ;
  final   Widget? icon;
  const CustomElevatedButton({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(24)
          ),
          padding: EdgeInsetsGeometry.all(16.h.w),
          backgroundColor: Colors.blueAccent,

        ),
        onPressed: (){}, child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppTextStyle.font20.copyWith(color: Colors.white)),
        if(icon!=null ) icon!,
      ],

    )
    );
  }
}
