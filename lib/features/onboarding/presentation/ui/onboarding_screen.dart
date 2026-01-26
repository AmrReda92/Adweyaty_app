import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:adweyaty_application/features/onboarding/presentation/widget/custom_dot_indicator.dart';
import 'package:adweyaty_application/generated/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingItems items =OnboardingItems();
  PageController controller =PageController();
  int currentIndex=0;


  @override

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: items.items.length,
              onPageChanged: (index){
                setState(() {
                  currentIndex=index;
                });
              },
                itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 16.w),
                   child: Column(
                     children: [
                       SizedBox(height: 60.h,),
                       Lottie.asset(items.items[index].image,height: 300.h),
                       SizedBox(height: 20.h,),
                       Text(S.of(context).translate((items.items[index].textKey)),style: AppTextStyle.font20black),
                     ],
                   ),
                 );
                },

            ),
            Positioned(
              bottom: 30.h,
              left: 0,
              right: 0,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    GestureDetector(
                       onTap: (){
                        if(currentIndex!=items.items.length-1){
                          controller.jumpToPage(currentIndex+1);
                        }else{
                          Navigator.pushNamedAndRemoveUntil(context, Routes.signUpLoginScreen, (e)=>false);
                        }
                       },
                        child:(currentIndex!=items.items.length-1)? CustomButton(title: S.of(context).titleOnBoardingOne) :CustomButton(title: S.of(context).titleOnBoardingThree)  ),
                    SizedBox(height: 20.h),
                    CustomDotIndicator(activeIndex: currentIndex),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60.h,
              right: 30.w,
                child: TextButton(
                  onPressed: () {
                   controller.jumpToPage(items.items.length);
                  },
                  child:(currentIndex!=items.items.length-1)?Text("Skip",style: AppTextStyle.hintStyle,):Text("")
                  )
            )
          ],
        ),

    );
  }
}
