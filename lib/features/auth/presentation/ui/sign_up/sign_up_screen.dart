import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_text_form_field.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpLoginScreen()));
                      },
                        icon: Icon(Icons.arrow_back,size: 28.sp,)),
                      Image.asset(AppImages.logo),
                      Opacity(
                        opacity: 0,
                        child: Icon(Icons.arrow_back, size: 28.sp),
                      ),

                    ],
                  ),
                  SizedBox(height: 107.h,),
                  CustomTextFormField(hintText: "Name"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Mobile"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Email"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Password"),
                  SizedBox(height: 50.h,),
                  CustomButton(title: "Register")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
