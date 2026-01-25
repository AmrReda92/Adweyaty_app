import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/helper/local_storage_service.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../home/data/cubit/home_cubit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    super.initState();
    navigateToOnboarding();
  }

  void navigateToOnboarding() async{
    await  Future.delayed(Duration(seconds: 3));
    if (LocalStorageService.isLoggedIn()) {
      try {
        final uid = FirebaseAuth.instance.currentUser!.uid;

        final userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .get();

        final user = UserModel.fromJson(userDoc.data()!);

        context.read<HomeCubit>().loadUserData(user);

        Navigator.pushReplacementNamed(
          context,
          Routes.bottomNavBarScreen,
        );
      } catch (e) {
        Navigator.pushReplacementNamed(
          context,
          Routes.onboardingScreen,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.signUpLoginScreen,
      );
    }

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(AppImages.splashBackground).image,
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppImages.splashLogo,height: 160),
                SizedBox(height: 30.h,),
                Text( S.of(context).splashText,style: AppTextStyle.font20White.copyWith(color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
