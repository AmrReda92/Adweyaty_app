import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppbarCategory(
       title: "My Favourite",
       leading: GestureDetector(
           onTap: (){
             Navigator.pushNamed(context, Routes.bottomNavBarScreen);
           },
           child: Icon(Icons.arrow_back, size: 28.sp)),
       icon: Icon(Icons.shopping_cart, size: 25.h, color: Colors.white),
     ),

    );
  }
}
