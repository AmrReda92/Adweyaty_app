import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:adweyaty_application/features/favourite/data/models/favourite_item_model.dart';
import 'package:adweyaty_application/features/favourite/presentation/widgets/favourite_cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../data/cubit/favourite_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavouriteCubit>();


    return Scaffold(
      appBar: CustomAppbarCategory(
        title: "My Favourite",
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.bottomNavBarScreen);
          },
          child: Icon(Icons.arrow_back, size: 28.sp),
        ),
        icon: Icon(Icons.shopping_cart, size: 25.h, color: Colors.white),
      ),
      body: StreamBuilder<List<FavouriteItemModel>>(
        stream: favCubit.getFavourites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading favourites"));
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text("No favourites yet"),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.all(12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: .72,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return FavouriteCartItem(favouriteItemModel: item,);
            },
          );
        },
      ),
    );
  }
}
