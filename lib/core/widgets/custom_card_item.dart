import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_images/app_images.dart';
import '../theme/app_text_style.dart';
import 'custom_circle_button.dart';

class CustomCardItem extends StatefulWidget {
  const CustomCardItem({super.key});

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  int textNum = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  AppImages.panadol,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Panadol",
                    style: AppTextStyle.medicineName.copyWith(fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Size: 120mm",
                    style: AppTextStyle.sizeMedicine,
                  ),
                  SizedBox(height: 12.h),


                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            textNum += 1;
                          });
                        },
                        child: const CustomCircleButton(icon: Icons.add),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        textNum.toString(),
                        style: AppTextStyle.font18,
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (textNum > 0) {
                              textNum -= 1;
                            }
                          });
                        },
                        child: const CustomCircleButton(icon: Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$23",
                  style: AppTextStyle.font18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
