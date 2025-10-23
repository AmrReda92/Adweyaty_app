import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding.dart';
import 'package:adweyaty_application/features/onboarding/presentation/ui/onboarding_first_screen.dart';
import 'package:flutter/material.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Cairo",
            scaffoldBackgroundColor: Colors.lightBlueAccent
        ),
        home: Onboarding(),
      ),
    );
  }
}
