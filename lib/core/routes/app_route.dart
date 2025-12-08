import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/login/cubit/login_cubit.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/login/ui/login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up/cubit/sign_up_cubit.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up/ui/sign_up_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/validation_success/validation_success_screen.dart';
import 'package:adweyaty_application/features/bottom_nav_bar/presentation/ui/bottom_nav_bar_screen.dart';
import 'package:adweyaty_application/features/cart/presentation/ui/cart_screen.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:adweyaty_application/features/home/presentation/ui/home_screen.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:adweyaty_application/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/model/homeCategoryModel.dart';
import '../../features/product_screens/ui/product_screen.dart';

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
              create: (context) => SignUpCubit(),
              child: SignUpScreen(),
            ));

      case Routes.loginScreen :
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginScreen(),
            ));


      case Routes.homeScreen :
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.bottomNavBarScreen :
        final user = setting.arguments as UserModel ;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => HomeCubit()..loadUserData(user),
              child: BottomNavBarScreen(),
            ));

      case Routes.cartScreen :
        return MaterialPageRoute(builder: (_) => CartScreen());
      
      case Routes.productScreen :
        final category = setting.arguments as HomeCategoryModel;

        return MaterialPageRoute(builder: (_) => ProductScreen(categoryProduct: category));


      case Routes.validationScreen :
        final user = setting.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => ValidationSuccessScreen(user:user));
    }
    return null;
  }
}
