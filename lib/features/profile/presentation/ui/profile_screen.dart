import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button_profile.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(
          title: "My profile",
        icon: InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.signUpLoginScreen);
          },
            child: Icon(Icons.logout,size: 30.w,)),
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
                BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state is HomeDataSuccess){
                    return Text(state.user.name,style: AppTextStyle.font20black,);
                  }
                  return Text("User");
                },
                )
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
