import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';

class CustomRowDrawer extends StatelessWidget {
  final IconData? icon;
  final String title ;
  const CustomRowDrawer({super.key, this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),child: Icon(icon,size: 20,),
        ),
        SizedBox(width: 20.w,),
        Text(title,style: AppTextStyle.font18,)
      ],
    );
  }
}
