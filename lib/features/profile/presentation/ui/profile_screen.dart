import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_button_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(
          title: "My profile",
        icon: Icon(Icons.logout,size: 30.w,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50.r,
                ),
                SizedBox(width: 20.w,),
                Text("Amr Reda",style: AppTextStyle.font20black,)
              ],
            ),
            SizedBox(height: 40.h,),
            CustomButtonProfile(title: "My orders",iconProfileScreen: Icons.arrow_right,),
            SizedBox(height: 14.h,),
            CustomButtonProfile(title: "Edit Profile",iconProfileScreen: Icons.arrow_right,),
            SizedBox(height: 14.h,),
            CustomButtonProfile(title: "Reset Password",iconProfileScreen: Icons.arrow_right,),
            SizedBox(height: 14.h,),
            CustomButtonProfile(title: "Contact us",iconProfileScreen: Icons.arrow_right,),
            SizedBox(height: 14.h,),
            CustomButtonProfile(title: "Privacy & Terms",iconProfileScreen: Icons.arrow_right,),


          ],
        ),
      ),

    );
  }
}
