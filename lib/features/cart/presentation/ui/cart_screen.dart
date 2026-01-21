import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_card_item.dart';
import 'package:adweyaty_application/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return StreamBuilder<List<CartItemModel>>(
      stream: cartCubit.getCartItems(),
      builder: (context, asyncSnapshot) {

        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (asyncSnapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text("Error loading cart")),
          );
        }

        final items = asyncSnapshot.data ?? [];

        // حساب التوتال هنا
        num totalPrice = 0;
        for (var item in items) {
          totalPrice += item.price * item.quantity;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppbarCategory(
            icon: Icon(Icons.shopping_cart, size: 25.h, color: Colors.white),
            title: S.of(context).myCart,
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.bottomNavBarScreen);
              },
              child: Icon(Icons.arrow_back, size: 28.sp),
            ),
          ),
          body: items.isEmpty
              ?  Center(child: Lottie.asset(AppImages.noProduct))
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCardItem(item: items[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5.h);
              },
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          "Total Price",
                          style: AppTextStyle.font20black,
                        ),
                      ),
                      Text(
                        "$totalPrice EGP",
                        style: AppTextStyle.font20black,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const CustomButton(title: "Checkout"),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

