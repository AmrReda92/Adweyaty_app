import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_appbar_category.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_snackBar.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../cart/data/models/cart_item_model.dart';
import '../../favourite/data/cubit/favourite_cubit.dart';
import '../../favourite/data/models/favourite_item_model.dart';
import '../data/models/drug_item_details.dart';

class ProductDetailsScreen extends StatefulWidget {
  final DrugItemDetails drugItem ;
  const ProductDetailsScreen({super.key, required this.drugItem});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarCategory(
        title: 'Product Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Image
              Center(
                child: Container(
                  height: 220.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.drugItem.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                widget.drugItem.name,
                style: AppTextStyle.medicineName.copyWith(
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                "${widget.drugItem.price} EGP",
                style: AppTextStyle.price.copyWith(
                  fontSize: 20.sp,
                ),
              ),

              SizedBox(height: 16.h),

              /// Description
              Text(
                "Description",
                style: AppTextStyle.font20black.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                 widget.drugItem.description??"",
                style: AppTextStyle.hintStyle.copyWith(
                ),
              ),

              SizedBox(height: 30.h),

              /// Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        final cartItem = CartItemModel(
                          productId: widget.drugItem.id,
                          name: widget.drugItem.name,
                          image: widget.drugItem.image,
                          price: widget.drugItem.price,
                          quantity: 1,
                        );
                        context.read<CartCubit>().addToCart(cartItem);
                        CustomSnackBar.show(
                          context,
                          message: "Added to cart",
                          backgroundColor: Colors.green,
                        );

                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        final favCubit = context.read<FavouriteCubit>();
                        final favItem = FavouriteItemModel(
                          productId: widget.drugItem.id,
                          name: widget.drugItem.name,
                          image: widget.drugItem.image,
                          price: widget.drugItem.price,
                        );

                        if (isSelected) {
                          favCubit.removeFavourite(favItem);
                        } else {
                          favCubit.addFavourite(favItem);
                        }

                        setState(() {
                          isSelected = !isSelected;

                        });
                      },
                        child: isSelected? const Icon(Icons.favorite,size: 20,color: Colors.red,) :const Icon(Icons.favorite_border,size: 20,)

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
