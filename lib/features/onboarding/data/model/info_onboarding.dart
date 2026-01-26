import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/features/onboarding/data/model/onboarding_info.dart';



class OnboardingItems {
  final List<OnboardingInfo> items =[
    OnboardingInfo(
        image: AppImages.onboardingOne,
      textKey: "textOnboardingOne"
    ),
    OnboardingInfo(
      image: AppImages.onboardingTwo,
      textKey: "textOnboardingTwo"
    ),
    OnboardingInfo(
      image: AppImages.onboardingThree,
      textKey: "textOnboardingThree"
    ),
  ];
}