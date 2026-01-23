import 'package:adweyaty_application/core/localization/language_cubit/language_cubit.dart';
import 'package:adweyaty_application/core/routes/app_route.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:adweyaty_application/features/cart/data/repo/cart_repo.dart';
import 'package:adweyaty_application/features/favourite/data/cubit/favourite_cubit.dart';
import 'package:adweyaty_application/features/favourite/data/repo/favourite_repo.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:adweyaty_application/features/wallet/data/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/wallet/data/models/repo/wallet_repo.dart';
import 'generated/l10n.dart';

class Adweyaty extends StatelessWidget {
  const Adweyaty({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomeCubit()
          ),
          BlocProvider(
              create: (context) => CartCubit(CartRepo(),)
          ),
          BlocProvider(
              create: (context) => LanguageCubit()
          ),
          BlocProvider(
              create: (context) => FavouriteCubit(FavouriteRepo())
          ),
          BlocProvider(
              create: (context)=>WalletCubit(WalletRepo())
          )
        ],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
                onGenerateRoute: AppRoute.generateRoute,
                locale: locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    scaffoldBackgroundColor: Color(0xffF0FFFF),
                    fontFamily: "Cairo"
                ),
                initialRoute: Routes.splashScreen
            );
          },
        ),
      ),
    );
  }
}
