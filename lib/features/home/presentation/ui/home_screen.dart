import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/grid_view_horizontal_items.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppbarCategory(
          title: "Home Page",
          icon: Icon(Icons.shopping_cart,size: 30.h,),
          leading: Icon(Icons.list,size: 30.h,),
        
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: AppTextStyle.font20black.copyWith(fontSize: 18)),
                    Text("Show All >",style: AppTextStyle.font20black.copyWith(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10.h,),
                const  GridViewHorizontalItems(),
                SizedBox(height: 40.h,),
                CustomElevatedButton(
                  title: "Send your Prescription",
                  onPressed: (){
                  },
                  icon: Icon(Icons.camera_alt_rounded,size: 34.r,color: Colors.white,)
                ),
                SizedBox(height: 26.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
