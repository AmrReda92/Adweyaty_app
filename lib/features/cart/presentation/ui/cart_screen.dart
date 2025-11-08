import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(
        title: "Cart",
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back, size: 28.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.panadol,
                      height: 120.h,
                      width: 120.w,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Panadol",
                          style: AppTextStyle.medicineName.copyWith(fontSize: 22),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              "Size : 120mm",
                              style: AppTextStyle.sizeMedicine,
                            ),
                            SizedBox(width: 60.w),
                            Text(
                              "\$230",
                              style: AppTextStyle.font18,
                            ),
                          ],
                        ),

                        SizedBox(height: 28.h),

                        Row(
                          spacing: 10.w,
                          children: [
                            Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                            ),
                            Text("01", style: AppTextStyle.font18),
                            Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.remove, color: Colors.white, size: 20.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
