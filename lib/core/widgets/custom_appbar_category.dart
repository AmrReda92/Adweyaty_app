import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_search_field.dart';

class CustomAppbarCategory extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading ;
  final Widget? icon ;
  final bool? centerTitle ;
  const CustomAppbarCategory({super.key, required this.title, this.leading, this.icon, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          leading: leading ,
          title: Text(title,style: AppTextStyle.appBarTitle,),
          centerTitle: centerTitle,
          backgroundColor: Colors.blueAccent,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: icon
            ),
          ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical:12.h),
            child: const CustomSearchField(),
          ),
      ),
        );

  }
  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight + 64.h);

}
