import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/login/login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpLoginScreen extends StatefulWidget {
  const SignUpLoginScreen({super.key});

  @override
  State<SignUpLoginScreen> createState() => _SignUpLoginScreenState();
}

class _SignUpLoginScreenState extends State<SignUpLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(AppImages.splashBackground).image,
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:26.w),
              child: Column(
                children: [
                  Image.asset(AppImages.logo),
                  SizedBox(height: 65.h,),
                  Image.asset(AppImages.homePhoto),
                  SizedBox(height: 65.h,),
                  Text("Welcome To Adweyaty",style: AppTextStyle.font20black.copyWith(fontSize: 30.sp),),
                  SizedBox(height: 90.h,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.signUpScreen, (e)=>false);
                      });
                    },
                      child: CustomButton(title: "Register")
                  ),
                  SizedBox(height: 20.h,),
                  InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (e)=>false);
                        });
                      },
                      child: CustomButton(title: "Login")
                  ),


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
