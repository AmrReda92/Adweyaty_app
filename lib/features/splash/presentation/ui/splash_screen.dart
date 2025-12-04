import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    super.initState();
    navigateToOnboarding();
  }

  void navigateToOnboarding() async{
    await  Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(context, Routes.onboardingScreen, (e)=>false);
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(AppImages.splashBackground).image,
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(InfoOnboarding.splashImage,height: 160),
                SizedBox(height: 30.h,),
                Text( S.of(context).splashText,style: AppTextStyle.font20White.copyWith(color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
