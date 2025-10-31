import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';

class OnboardingThirdPage extends StatelessWidget {
  final void Function()? onTapNextPage ;

  const OnboardingThirdPage({super.key, this.onTapNextPage});

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
            textAlign: TextAlign.center, style: AppTextStyle.font20),
          SizedBox(height: 90.h,),
          InkWell(
              onTap: onTapNextPage,
              child: CustomButton(title: "Start Now"))

        ],
      ),
    );
  }
}


