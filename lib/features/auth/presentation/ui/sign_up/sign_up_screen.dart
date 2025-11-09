import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_text_form_field.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                children: [
                  CustomAppbar(),
                  SizedBox(height: 30.h,),
                  Image.asset(AppImages.user,width: 80.w,height: 80.h,),
                  SizedBox(height: 40.h,),
                  Text("Register to your account",style: AppTextStyle.font28),
                  SizedBox(height: 40.h,),
                  CustomTextFormField(hintText: "Name"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Mobile"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Email"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Password",isPassword: true,),
                  SizedBox(height: 50.h,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, Routes.validationScreen, (e)=>false);
                    },
                      child: CustomButton(title: "Register"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
