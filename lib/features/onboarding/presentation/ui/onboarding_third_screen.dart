import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/widgets/custom_button.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 60.h,),
          Lottie.asset(InfoOnboarding.imageOnboardingThree),
          SizedBox(height: 16.h,),
          Text(InfoOnboarding.textOnboardingThree,
            textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          SizedBox(height: 90.h,),
          CustomButton(title: "التالي")

        ],
      ),
    );
  }
}


