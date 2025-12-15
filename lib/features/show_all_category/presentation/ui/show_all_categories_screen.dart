import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/features/show_all_category/presentation/widgets/all_categories_vertical_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAllCategoriesScreen extends StatelessWidget {
  const ShowAllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppbarCategory(
        title: "All Categories" ,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Expanded(child: AllCategoriesVerticalView())
          ],
        ),
      ) ,
    );
  }
}
