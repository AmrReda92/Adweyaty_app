import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_first_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_second_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            children: [
              OnboardingFirstScreen(),
              OnboardingSecondScreen(),
              OnboardingThirdScreen(),
            ]
        )
    );
  }
}
