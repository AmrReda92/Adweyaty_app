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
                  CustomTextFormField(hintText: "Email"),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(hintText: "Password"),
                  SizedBox(height: 50.h,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ValidationSuccessScreen()));
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
