import 'dart:io';

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
import 'package:adweyaty_application/features/credit_checkout_screen/presentation/ui/credit_checkout_screen.dart';
import 'package:adweyaty_application/features/favourite/presentation/ui/favourite_screen.dart';
import 'package:adweyaty_application/features/home/data/cubit/categories_cubit.dart';
import 'package:adweyaty_application/features/home/data/home_repo/home_repo.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:adweyaty_application/features/product_screens/data/cubit/products_cubit.dart';
import 'package:adweyaty_application/features/product_screens/data/models/drug_item_details.dart';
import 'package:adweyaty_application/features/product_screens/data/products_repo/products_repo.dart';
import 'package:adweyaty_application/features/product_screens/ui/product_details_screen.dart';
import 'package:adweyaty_application/features/profile/data/cubit/profile_cubit.dart';
import 'package:adweyaty_application/features/profile/data/repo/profile_photo_repo.dart';
import 'package:adweyaty_application/features/profile/presentation/ui/profile_screen.dart';
import 'package:adweyaty_application/features/show_all_category/presentation/ui/show_all_categories_screen.dart';
import 'package:adweyaty_application/features/splash/presentation/ui/splash_screen.dart';
import 'package:adweyaty_application/features/wallet/data/cubit/wallet_cubit.dart';
import 'package:adweyaty_application/features/wallet/presentation/ui/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/model/homeCategoryModel.dart';
import '../../features/product_screens/ui/product_screen.dart';
import '../../features/wallet/data/models/repo/wallet_repo.dart';

class AppRoute {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.signUpLoginScreen:
        return MaterialPageRoute(builder: (_) => const SignUpLoginScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );

      case Routes.showAllCategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CategoriesCubit(HomeRepo())..getCategories(),
            child: ShowAllCategoriesScreen(),
          ),
        );

      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CategoriesCubit(HomeRepo())..getCategories(),
              ),
              BlocProvider(
                create: (context) => ProfileCubit(ProfilePhotoRepo()),
              ),
              BlocProvider(
                create: (context) => WalletCubit(WalletRepo()),
                child: WalletScreen(),
              ),
            ],
            child: const BottomNavBarScreen(),
          ),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.favouriteScreen:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());

      case Routes.walletScreen:
        return MaterialPageRoute(
          builder: (_) => WalletScreen(),
        );

      case Routes.creditCheckoutScreen:
        final total = setting.arguments as num;
        return MaterialPageRoute(
          builder: (_) => CreditCheckoutScreen(totalPrice: total),
        );

      case Routes.productScreen:
        final category = setting.arguments as HomeCategoryModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductsCubit(ProductsRepo())
                  ..getProductsByCategory(category.id),
            child: ProductScreen(categoryProduct: category),
          ),
        );

      case Routes.validationScreen:
        final user = setting.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => ValidationSuccessScreen(user: user),
        );

      case Routes.productDetailsScreen:
        final drugItemDetails = setting.arguments as DrugItemDetails;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(drugItem: drugItemDetails),
        );
    }
    return null;
  }
}
