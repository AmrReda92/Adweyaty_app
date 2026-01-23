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
          // ممكن هنا بعدين توديه على WalletScreen
        },
        child: const Text("Recharge"),
      ),
    ],
  );
}
