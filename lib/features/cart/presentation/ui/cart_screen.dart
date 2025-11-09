import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_card_item.dart';
import 'package:adweyaty_application/core/widgets/custom_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbarCategory(
        title: "Cart",
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back, size: 28.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return CustomCardItem();
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h,) ;
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: AppTextStyle.font20White,),
                  Text("0",style: AppTextStyle.font20White,)
                ],
              ),
              SizedBox(height: 10.h,),
              CustomButton(title: "Chekout"),
              SizedBox(height: 20.h,)

            ],
          ),
        ),
        ),
    );
  }
}
