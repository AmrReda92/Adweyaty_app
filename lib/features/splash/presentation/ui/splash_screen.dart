import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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

  Future<void> navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()), (e)=>false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(InfoOnboarding.splashImage,height: 160),
              SizedBox(height: 30.h,),
              Text("صيدلية",style: AppTextStyle.font20.copyWith(color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
