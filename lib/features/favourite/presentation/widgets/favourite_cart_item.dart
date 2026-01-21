import 'package:adweyaty_application/features/favourite/data/models/favourite_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../cart/data/cart_cubit/cart_cubit.dart';
import '../../../cart/data/models/cart_item_model.dart';
import '../../data/cubit/favourite_cubit.dart';

class FavouriteCartItem extends StatelessWidget {
  final FavouriteItemModel favouriteItemModel ;
  const FavouriteCartItem({super.key, required this.favouriteItemModel});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final favCubit = context.read<FavouriteCubit>();
    return Stack(
      children: [
        Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: favouriteItemModel.image,
                  height: 100.h,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
                ),
                SizedBox(height: 8.h),
                Text(
                  favouriteItemModel.name,
                  style: AppTextStyle.medicineName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "${favouriteItemModel.price} EGP",
                  style: AppTextStyle.price,
                ),
                const Spacer(),
                /// Buttons Row
                Row(
                  children: [
                    /// Add to Cart
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async{
                          final cartItem = CartItemModel(
                            productId: favouriteItemModel.productId,
                            name: favouriteItemModel.name,
                            image: favouriteItemModel.image,
                            price: favouriteItemModel.price,
                            quantity: 1,
                          );

                         await cartCubit.addToCart(cartItem);
                         await favCubit.moveToCart(favouriteItemModel);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                          EdgeInsets.symmetric(vertical: 6.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: Container(
            width: 22.w,
            height: 22.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  favCubit.removeFavourite(favouriteItemModel);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
