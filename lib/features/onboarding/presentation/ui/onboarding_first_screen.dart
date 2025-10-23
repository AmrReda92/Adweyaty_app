import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
           SizedBox(height: 60.h,),
           Lottie.asset("assets/images/Pharmacist.json"),
           SizedBox(height: 16.h,),
           Text("تطبيق صيدلية للطلبات",style: TextStyle(
             fontSize: 20
           ),)
       ],
    );

  }
}
