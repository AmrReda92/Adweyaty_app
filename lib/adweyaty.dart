import 'package:adweyaty_application/core/routes/app_route.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adweyaty extends StatelessWidget {
  const Adweyaty({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: AppRoute.Function ,

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar','AR'), // arabic
        ],

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffF0FFFF),
         fontFamily: "Cairo"
        ),
           initialRoute:  Routes.splashScreen,
      ),
    );
  }
}
