import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title ;
  final   Widget? icon;
  final  void Function()? onPressed;
  const CustomElevatedButton({super.key, required this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB140C5),
            Color(0xFF007AFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),

      child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
            ),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

          ),
          onPressed: onPressed
          , child:
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: AppTextStyle.font20White.copyWith(color: Colors.white)),
          if(icon!=null ) icon!,
        ],

      )
      ),
    );
  }
}
