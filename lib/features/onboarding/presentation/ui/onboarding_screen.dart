import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/widget/custom_dot_indicator.dart';
import 'package:adweyaty_application/features/onboarding/presentation/widget/onboarding_second_page.dart';
import 'package:adweyaty_application/features/onboarding/presentation/widget/onboarding_third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/onboarding_first_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController nextPage = PageController();
  int currentIndex=0;
  @override

  void dispose() {
    nextPage.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: nextPage,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                    children:  [
                      OnboardingFirstPage(
                        onTapNextPage: (){
                          nextPage.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        },
                      ),
                      OnboardingSecondPage(
                        onTapNextPage: (){
                          nextPage.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        },
                      ),
                      OnboardingThirdPage(onTapNextPage: (){
                        Navigator.pushNamedAndRemoveUntil(context, Routes.signUpLoginScreen, (e)=>false);
                      },
                      ),
                    ],
                ),
              ),
              CustomDotIndicator(activeIndex: currentIndex),
              SizedBox(height: 50.h),
            ],

          ),
        ),

    );
  }
}
