import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingFirstPage extends StatelessWidget {
  final void Function() onTapNextPage ;
  const OnboardingFirstPage({super.key, required this.onTapNextPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
         children: [
             SizedBox(height: 60.h,),
             Lottie.asset(InfoOnboarding.imageOnboardingOne),
             SizedBox(height: 16.h,),
             Text( InfoOnboarding.textOnboardingOne,
              textAlign: TextAlign.center, style: AppTextStyle.font20),
           SizedBox(height: 90.h,),
           InkWell(
               onTap: onTapNextPage,
               child: CustomButton(title: "التالي",)),

         ],
      ),
    );

  }
}
