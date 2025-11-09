import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/validation_success/validation_success_screen.dart';
import 'package:adweyaty_application/features/bottom_nav_bar/presentation/ui/bottom_nav_bar_screen.dart';
import 'package:adweyaty_application/features/cart/presentation/ui/cart_screen.dart';
import 'package:adweyaty_application/features/home/presentation/ui/home_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:adweyaty_application/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

 static Route<dynamic>? Function(RouteSettings setting){
    switch (setting.name){
      case Routes.splashScreen :
        return MaterialPageRoute(builder: (_)=>SplashScreen());

      case Routes.onboardingScreen :
        return MaterialPageRoute(builder: (_)=>OnboardingScreen());

      case Routes.signUpLoginScreen :
        return MaterialPageRoute(builder: (_)=>SignUpLoginScreen());

      case Routes.homeScreen :
        return MaterialPageRoute(builder: (_)=>HomeScreen());

      case Routes.bottomNavBarScreen :
        return MaterialPageRoute(builder: (_)=>BottomNavBarScreen());

      case Routes.cartScreen :
        return MaterialPageRoute(builder: (_)=>CartScreen());

      case Routes.validationScreen :
        return MaterialPageRoute(builder: (_)=>ValidationSuccessScreen());

  }
  }
}
