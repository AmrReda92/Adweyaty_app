import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbarCategory extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbarCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      actions: [
        SvgPicture.asset(AppImages.cartIcon,width: 30.w,height: 30.h,),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(56.h);

}
