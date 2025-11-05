import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/category_items.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/features/onboarding/data/model/info_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.cartIcon,)),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.list,size: 40,))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: AppTextStyle.font20.copyWith(fontSize: 18)),
                    Text("Show All",style: AppTextStyle.font20.copyWith(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10.h,),
                CategoryItems(),
                SizedBox(height: 40.h,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsetsGeometry.all(16.h.w),
                    backgroundColor: Colors.blueAccent,

                  ),
                    onPressed: (){}, child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Send your Prescription",style: AppTextStyle.font20.copyWith(color: Colors.white)),
                    Icon(Icons.camera_alt_rounded,size: 30.r,)
                  ],

                )
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
