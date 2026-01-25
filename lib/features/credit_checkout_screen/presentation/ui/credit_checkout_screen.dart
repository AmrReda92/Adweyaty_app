import 'package:adweyaty_application/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:adweyaty_application/features/my_order/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_appbar_category.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../../my_order/data/cubit/orders_cubit.dart';
import '../../../wallet/data/cubit/wallet_cubit.dart';
import '../widgets/recharge_dialog.dart';
import '../widgets/success_dialog.dart';

class CreditCheckoutScreen extends StatelessWidget {
  final num totalPrice;

  const CreditCheckoutScreen({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final walletCubit = context.read<WalletCubit>();
    final cartCubit = context.read<CartCubit>();
    final ordersCubit = context.read<OrdersCubit>();


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

        if (state is WalletSuccess)  {
          _handleOrderSuccess(context, cartCubit, ordersCubit,totalPrice);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbarCategory(
          title: S.of(context).walletCheckout,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: StreamBuilder<num>(
            stream: walletCubit.getBalance(),
            builder: (context, snapshot) {
              final balance = snapshot.data ?? 0;
              final bool canPay = balance >= totalPrice;

              return Column(
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
                          "$balance ${S.of(context).points}",
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
                        const Divider(),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).paymentStatus,
                              style: AppTextStyle.font18,
                            ),
                            Text(
                              canPay
                                  ? S.of(context).sufficientBalance
                                  : S.of(context).insufficientBalance,
                              style: AppTextStyle.font18.copyWith(
                                color:
                                canPay ? Colors.green : Colors.red,
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
                    title: canPay
                        ? S.of(context).confirmPayment
                        : S.of(context).rechargeWallet,
                    onTap: () {
                      if (canPay) {
                        walletCubit.spendBalance(totalPrice);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => rechargeDialog(context),
                        );
                      }
                    },
                  ),

                  SizedBox(height: 60.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}


Future<void> _handleOrderSuccess(
BuildContext context,
CartCubit cartCubit,
OrdersCubit ordersCubit,
    num totalPrice,
    ) async {
  final cartItems = await cartCubit.getCartOnce();

  // 2. كوّن OrderModel بسيط
  final order = OrderModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    items: cartItems,
    totalPrice: totalPrice,
    date: Timestamp.now(), status: 'Success',
  );
  await ordersCubit.createOrder(order);
  await cartCubit.clearCart();


  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => successDialog(context),
  );
}