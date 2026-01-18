import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/data/cart_cubit/cart_cubit.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import '../app_images/app_images.dart';
import '../theme/app_text_style.dart';
import 'custom_circle_button.dart';

class CustomCardItem extends StatelessWidget {
  final CartItemModel item;
  const CustomCardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: AppTextStyle.medicineName.copyWith(fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Size: 120mm",
                    style: AppTextStyle.sizeMedicine,
                  ),
                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                         cartCubit.increaseQuantity(item);
                        },
                        child: const CustomCircleButton(icon: Icons.add),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "${item.quantity}",
                        style: AppTextStyle.font18,
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          cartCubit.decreaseQuantity(item);
                        },
                        child: const CustomCircleButton(icon: Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${item.price} EGP",
                  style: AppTextStyle.font18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
