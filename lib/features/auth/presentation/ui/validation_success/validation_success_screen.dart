import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_images/app_images.dart';
import '../sign_up_login/sign_up_login_screen.dart';

class ValidationSuccessScreen extends StatefulWidget {
  const ValidationSuccessScreen({super.key});

  @override
  State<ValidationSuccessScreen> createState() => _ValidationSuccessScreenState();
}

class _ValidationSuccessScreenState extends State<ValidationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
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
                      SizedBox(height: 192.h,),
                      CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        radius: 30.r,
                        child: Icon(Icons.check),
                      ),
                      SizedBox(height: 16.h,),
                      Text("Account successfully created",style: AppTextStyle.font20black.copyWith(fontSize: 20),),
                      SizedBox(height: 8.h,),
                      Text("Welcome to Adweyaty!",style: AppTextStyle.font20White.copyWith(fontSize: 18,color: Colors.grey),),
                      SizedBox(height: 260.h,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.pushNamedAndRemoveUntil(context, Routes.bottomNavBarScreen, (e)=>false);
                          });
                        },
                          child: CustomButton(title: "Start Now")
                      )
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
