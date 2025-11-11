import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_elevated_button.dart';
import 'package:adweyaty_application/core/widgets/custom_elvated_button_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_images/app_images.dart';

class MedicineDetailsCard extends StatelessWidget {
  final String image ;
  final String name ;
  final String price ;
  const MedicineDetailsCard({super.key, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 5.w,),
      child: Card(
        elevation: 6,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image,height: 100.h,),
              SizedBox(height: 6.h,),
              Text(name,style: AppTextStyle.medicineName,),
              SizedBox(height: 6.h,),
              Text(price,style: AppTextStyle.price,),
              SizedBox(height: 6.h,),
              SizedBox(
                width: double.infinity,
                child: CustomElvatedButtonCard()
              )
            ],
          ),
        ),
      ),
    );
  }
}
