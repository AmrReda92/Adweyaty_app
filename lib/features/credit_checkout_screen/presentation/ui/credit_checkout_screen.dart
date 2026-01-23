import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_appbar_category.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';


class CreditCheckoutScreen extends StatelessWidget {
  final num totalPrice;

  const CreditCheckoutScreen({
    super.key,
    required this.totalPrice,
  });

  // مؤقتًا – بعدين نخليه ييجي من Firestore
  final num userCredits = 250;

  @override
  Widget build(BuildContext context) {
    final bool canPay = userCredits >= totalPrice;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppbarCategory(
        title: S.of(context).walletCheckout,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Wallet Balance Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB140C5),
                    Color(0xFF007AFF),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  S.of(context).yourWalletBalance,
                    style: AppTextStyle.font18.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "$userCredits ${S.of(context).points}",
                    style: AppTextStyle.font28.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            /// Order Summary
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).orderTotal,
                        style: AppTextStyle.font20black,
                      ),
                      Text(
                        "$totalPrice ${S.of(context).points}",
                        style: AppTextStyle.font20black.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Divider(),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).paymentStatus,
                        style: AppTextStyle.font18,
                      ),
                      Text(
                        canPay ?  S.of(context).sufficientBalance :   S.of(context).insufficientBalance,
                        style: AppTextStyle.font18.copyWith(
                          color: canPay ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Action Button
            CustomButton(
              title: canPay ? S.of(context).confirmPayment: S.of(context).rechargeWallet,
              onTap: () {
                if (canPay) {
                  _showSuccessDialog(context);
                } else {
                  _showRechargeDialog(context);
                }
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: const Text("Payment Successful 🎉"),
        content: const Text(
          "Your order has been placed successfully using wallet credits.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showRechargeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: const Text("Not Enough Credits"),
        content: const Text(
          "Your wallet balance is not enough to complete this order. Please recharge your wallet.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // هنا بعدين توديه على صفحة Recharge
            },
            child: const Text("Recharge"),
          ),
        ],
      ),
    );
  }
}
