import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget rechargeDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    title: const Text("Not Enough Credits"),
    content: const Text(
      "Your wallet balance is not enough to complete this order. Please recharge your wallet.",
    ),
  );
}
