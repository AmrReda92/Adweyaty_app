import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/features/cart/presentation/ui/cart_screen.dart';
import 'package:adweyaty_application/features/favourite/presentation/ui/favourite_screen.dart';
import 'package:adweyaty_application/features/home/presentation/ui/home_screen.dart';
import 'package:adweyaty_application/features/profile/presentation/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();

}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex=0;
  List <Widget> screens =[
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              currentIndex=index;
            });
          } ,
          backgroundColor: Colors.lightBlueAccent,
          type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.homeIcon,width: 28.w,height: 28.h,),label: "Home"),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.favouriteIcon,width: 28.w,height: 28.h,),label: "Favourite"),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.cartIcon,width: 28.w,height: 28.h,),label: "Cart"),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.profileIcon,width: 28.w,height: 28.h,),label: "Profile"),
            ]
        ),
        body: screens[currentIndex],


      ),
    );
  }
}
