import 'package:adweyaty_application/core/app_images/app_images.dart';
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:26.w),
            child: Column(
              children: [
                Image.asset(AppImages.logo),
                SizedBox(height: 65.h,),
                Image.asset(AppImages.homePhoto),
                SizedBox(height: 65.h,),
                Text("Adweyaty",style: AppTextStyle.font20.copyWith(fontSize: 30.sp),),
                SizedBox(height: 99.h,),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignUpScreen()), (e)=>false);
                    });
                  },
                    child: CustomButton(title: "تسجيل")
                ),
                SizedBox(height: 20.h,),
                InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (e)=>false);
                      });
                    },
                    child: CustomButton(title: "دخول")
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}
