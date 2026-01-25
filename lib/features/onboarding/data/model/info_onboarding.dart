import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/features/onboarding/data/model/onboarding_info.dart';



class OnboardingItems {
  final List<OnboardingInfo> items =[
    OnboardingInfo(
        image: AppImages.onboardingOne,
        text: "Adweyaty is not just an app, it's your healthcare companion, putting the pharmacy at your fingertips. Adweyaty is here to simplify your healthcare journey.",
    ),
    OnboardingInfo(
      image: AppImages.onboardingTwo,
      text: "Browse and discover Adweyaty's wide range of products for quick and effective discovery",
    ),
    OnboardingInfo(
      image: AppImages.onboardingThree,
      text: "Customer Support: Connect with our dedicated Adweyaty support team for quick and friendly assistance, and order easily and conveniently through our user-friendly interface.",
    ),
  ];
}