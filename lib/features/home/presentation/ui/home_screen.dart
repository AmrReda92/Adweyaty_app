import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/grid_view_horizontal_items.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_elevated_button.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        String title= "Welcome user";
        if(state is HomeDataSuccess){
           title = "Welcome ${state.user.name}";
        }
        return Scaffold(
          appBar: CustomAppbarCategory(
            centerTitle: false,
            title: title,
            icon: Icon(Icons.shopping_cart, size: 30.h, color: Colors.white,),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",
                          style: AppTextStyle.font20black.copyWith(
                              fontSize: 18)),
                      Text("Show All >",
                          style: AppTextStyle.font20black.copyWith(
                              fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  const GridViewHorizontalItems(),
                  SizedBox(height: 40.h,),
                  CustomElevatedButton(
                      title: "Send your Prescription",
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_rounded, size: 34.r,
                        color: Colors.white,)
                  ),
                  SizedBox(height: 26.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
