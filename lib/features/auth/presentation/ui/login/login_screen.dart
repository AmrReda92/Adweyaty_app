import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/validation_success/validation_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../sign_up_login/sign_up_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppbar(),
                  SizedBox(height: 30.h,),
                  Image.asset(AppImages.user,width: 80.w,height: 80.h,),
                  SizedBox(height: 40.h,),
                  Text("Sign in to your account",style: AppTextStyle.font28),
                  SizedBox(height: 66.h,),
                  CustomTextFormField(hintText: "Email"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Password",isPassword: true,),
                  SizedBox(height: 20.h,),
                  Align(
                    alignment: Alignment.centerRight,
                      child: Text("Forgot password?",style: AppTextStyle.hintStyle,)),
                  SizedBox(height: 40.h,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.bottomNavBarScreen, (e)=>false);
                      });
                    },
                      child: CustomButton(title: "Login")),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
