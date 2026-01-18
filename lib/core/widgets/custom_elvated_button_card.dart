import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/data/cart_cubit/cart_cubit.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import '../../features/product_screens/data/models/drug_item_details.dart';

class CustomElvatedButtonCard extends StatelessWidget {
  final DrugItemDetails drugItem;
  const CustomElvatedButtonCard({super.key, required this.drugItem});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ()
        {
          final cartItem = CartItemModel(
            productId: drugItem.id,
            name: drugItem.name,
            image: drugItem.image,
            price: drugItem.price,
            quantity: 1,
          );
          context.read<CartCubit>().addToCart(cartItem);
          CustomSnackBar.show(context, message: "Added to cart",backgroundColor: Colors.green);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff4779c8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h),
        ),
        child: Text("Add to Cart",style: AppTextStyle.medicineName.copyWith(color: Colors.white),)
    );
  }
}
