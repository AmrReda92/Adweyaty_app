import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/cubit/wallet_cubit.dart';

class WalletTopUpDialog extends StatelessWidget {
  final WalletCubit walletCubit;

  const WalletTopUpDialog({
    super.key,
    required this.walletCubit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return AlertDialog(
      title: const Text("Add Credits"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Enter amount",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final amount = num.tryParse(controller.text);
            if (amount != null && amount > 0) {
              walletCubit.addBalance(amount);
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }
}
