import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class SignUpLoginScreen extends StatelessWidget {
  const SignUpLoginScreen({super.key});

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
                  TweenAnimationBuilder<double>(
                      tween: Tween(begin: -50, end: 0),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, value),
                          child: Opacity(
                            opacity: value == 0 ? 1 : 0,
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(AppImages.logo)),
                  SizedBox(height: 65.h,),
                  TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.85, end: 1),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: Image.asset(AppImages.homePhoto)),
                  SizedBox(height: 65.h,),
                  Text(S.of(context).signUpLoginText,style: AppTextStyle.font20black.copyWith(fontSize: 30.sp),),
                  SizedBox(height: 90.h,),
                  InkWell(
                    onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, Routes.signUpScreen, (e)=>false);
                    },
                      child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 80, end: 0),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, value),
                              child: child,
                            );
                          },
                          child: CustomButton(title:S.of(context).register ))
                  ),
                  SizedBox(height: 20.h,),
                  InkWell(
                      onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (e)=>false);

                      },
                      child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 80, end: 0),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, value),
                              child: child,
                            );
                          },
                          child: CustomButton(title: S.of(context).login))
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
