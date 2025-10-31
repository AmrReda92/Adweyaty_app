import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/app_text_style.dart';

class OnboardingSecondPage extends StatelessWidget {
  final void Function() onTapNextPage ;

  const OnboardingSecondPage({super.key, required this.onTapNextPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 150.h,),
          Lottie.asset(InfoOnboarding.imageOnboardingTwo),
          SizedBox(height: 16.h,),
            Text(InfoOnboarding.textOnboardingTwo,
            textAlign: TextAlign.center, style: AppTextStyle.font20),
          SizedBox(height: 190.h,),
          InkWell(
              onTap: onTapNextPage,
              child: CustomButton(title: "Next"))
        ],
      ),
    );
  }
}
