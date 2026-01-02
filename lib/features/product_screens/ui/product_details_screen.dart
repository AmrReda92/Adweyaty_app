import 'package:adweyaty_application/features/product_screens/data/models/drug_item_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_appbar_category.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_color.dart';

class ProductDetailsScreen extends StatelessWidget {
  final DrugItemDetails drugItem ;
  const ProductDetailsScreen({super.key, required this.drugItem});

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
                      imageUrl: drugItem.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                drugItem.name,
                style: AppTextStyle.medicineName.copyWith(
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                "${drugItem.price} EGP",
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
                 drugItem.description??"",
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
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 26.sp,
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
