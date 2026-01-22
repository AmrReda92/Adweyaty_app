import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // مؤقتًا رصيد وهمي
    final double credits = 150.0;

    return Scaffold(
      appBar: const CustomAppbarCategory(
        title: "My Wallet",
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Wallet Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB140C5),
                    Color(0xFF007AFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available Credits",
                    style: AppTextStyle.font20White.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "$credits Points",
                    style: AppTextStyle.font20White.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            /// Add Credits Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Top up coming soon 🚀"),
                    ),
                  );
                },
                title: "Add Credits",
              ),
            ),

            SizedBox(height: 30.h),

            /// Transactions Title
            Text(
              "Recent Transactions",
              style: AppTextStyle.font20black.copyWith(
                fontSize: 18.sp,
              ),
            ),

            SizedBox(height: 12.h),

            /// Empty State (دلوقتي UI بس)
            Expanded(
              child: Center(
                child: Text(
                  "No transactions yet",
                  style: AppTextStyle.hintStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
