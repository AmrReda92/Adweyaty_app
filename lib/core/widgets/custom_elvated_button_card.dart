import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElvatedButtonCard extends StatelessWidget {
  const CustomElvatedButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2A9D8F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h),
        ),

        child: Text("Add to Cart",style: AppTextStyle.medicineName,)

    );
  }
}
