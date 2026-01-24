import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_appbar_category.dart';
import '../../data/cubit/orders_cubit.dart';
import '../../data/models/order_model.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbarCategory(
        title: "My Orders",
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: ordersCubit.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading orders"));
          }

          final orders = snapshot.data ?? [];

          if (orders.isEmpty) {
            return Center(
              child: Text(
                "No orders yet",
                style: AppTextStyle.hintStyle,
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(12.w),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              // أول منتج في الأوردر
              final item = order.items.first;
              return Card(
                elevation: 2,
                margin: EdgeInsets.only(bottom: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          item.image,
                          width: 50.w,
                          height: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 12.w),

                      /// Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Product Name
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.font18.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 6.h),

                            /// Date
                            Text(
                              DateFormat("dd MMM yyyy • hh:mm a")
                                  .format(order.date.toDate()),
                              style: AppTextStyle.hintStyle.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),

                            SizedBox(height: 6.h),

                            Row(
                              children: [
                                /// Status
                                _buildStatusChip("SUCCESS"),

                                const Spacer(),

                                /// Items Count
                                Text(
                                  "${order.items.length} items",
                                  style: AppTextStyle.font18.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },
          );
        },
      ),
    );
  }

  /// Chip الحالة (ثابتة Success)
  Widget _buildStatusChip(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: Colors.green,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
