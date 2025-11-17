import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/login/login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up/sign_up_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/validation_success/validation_success_screen.dart';
import 'package:adweyaty_application/features/bottom_nav_bar/presentation/ui/bottom_nav_bar_screen.dart';
import 'package:adweyaty_application/features/cart/presentation/ui/cart_screen.dart';
import 'package:adweyaty_application/features/home/presentation/ui/home_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:adweyaty_application/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {

  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen :
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.onboardingScreen :
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.signUpLoginScreen :
        return MaterialPageRoute(builder: (_) => SignUpLoginScreen());

      case Routes.signUpScreen :
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: SignUpScreen(),
            ));

      case Routes.loginScreen :
        return MaterialPageRoute(builder: (_) => LoginScreen());


      case Routes.homeScreen :
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.bottomNavBarScreen :
        return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

      case Routes.cartScreen :
        return MaterialPageRoute(builder: (_) => CartScreen());

      case Routes.validationScreen :
        return MaterialPageRoute(builder: (_) => ValidationSuccessScreen());
    }
  }
}
