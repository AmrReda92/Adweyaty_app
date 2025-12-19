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

  int textNum =0;


  @override
  Widget build(BuildContext context) {
    return Card(
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
                    SizedBox(width: 54.w),
                    Text(
                      "\$ 23",
                      style: AppTextStyle.font18,
                    ),
                  ],
                ),

                SizedBox(height: 28.h),
                Row(
                  spacing: 10.w,
                  children: [
                    GestureDetector(
                       onTap: (){
                         setState(() {
                           textNum+=1;
                         });
                       },
                        child: CustomCircleButton(icon: Icons.add,)),
                    Text(textNum.toString(), style: AppTextStyle.font18),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(textNum!=0){
                            textNum=textNum-1;
                          }

                        });
                      },
                        child: CustomCircleButton(icon: Icons.remove,)),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
