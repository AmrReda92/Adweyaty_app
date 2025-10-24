import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_first_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_second_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller =PageController();
  int currentIndex=0;
  @override

  void dispose() {
    controller.dispose();
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
                  onPageChanged: (index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                    children: const [
                      OnboardingFirstScreen(),
                      OnboardingSecondScreen(),
                      OnboardingThirdScreen(),
                    ],
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: currentIndex ,
                count: 3,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 30,
                  activeDotColor: Colors.blue
                ),
              ),
              SizedBox(height: 50.h),
            ],

          ),
        ),

    );
  }
}
