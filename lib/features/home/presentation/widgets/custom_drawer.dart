import 'package:adweyaty_application/features/home/presentation/widgets/custom_row_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade200,
      child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Column(
                children: [
                  Text("Adweyaty Application",
                    style: AppTextStyle.appBarTitle.copyWith(fontWeight: FontWeight.w700),),
                  Divider(
                    thickness: 1.h,
                    color: AppColor.outLineColor,
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),

              Column(
                spacing: 20.h,
                children: [
                  CustomRowDrawer(title: "Home",icon: Icons.home,),
                  CustomRowDrawer(title: "settings",icon: Icons.settings,),
                  CustomRowDrawer(title: "Home",icon: Icons.home,),
                  CustomRowDrawer(title: "Home",icon: Icons.home,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
