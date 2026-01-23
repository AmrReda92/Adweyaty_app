import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/features/wallet/data/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../widgets/wallet_topup_dialog.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletCubit = context.read<WalletCubit>();

    return BlocListener<WalletCubit, WalletState>(
      listener: (context, state) {
        if (state is WalletError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is WalletSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Wallet updated successfully"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppbarCategory(
          title: S.of(context).myWallet,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Wallet Card (رصيد Live)
              StreamBuilder<num>(
                stream: walletCubit.getBalance(),
                builder: (context, snapshot) {
                  final balance = snapshot.data ?? 0;

                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: const LinearGradient(
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
                          S.of(context).availableCredit,
                          style: AppTextStyle.font20White.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "$balance ${S.of(context).points}",
                          style: AppTextStyle.font20White.copyWith(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 30.h),

              /// Add Credits Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: S.of(context).addCredit,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => WalletTopUpDialog(
                        walletCubit: walletCubit,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30.h),

              /// Transactions Title
              Text(
                S.of(context).recentTransactions,
                style: AppTextStyle.font20black.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 12.h),

              /// Placeholder لحد ما نربط Stream العمليات
              Expanded(
                child: Center(
                  child: Text(
                    S.of(context).noTransactionYet,
                    style: AppTextStyle.hintStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
