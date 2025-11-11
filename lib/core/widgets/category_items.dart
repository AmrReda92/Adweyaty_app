import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/category_screens/cough_medicines/ui/cough_medicines_screen.dart';
import 'package:adweyaty_application/features/category_screens/headache/ui/headache_screen.dart';
import 'package:adweyaty_application/features/category_screens/pressure_medicines/ui/pressure_medicines_screen.dart';
import 'package:adweyaty_application/features/category_screens/temperature/ui/temperature_screen.dart';
import 'package:adweyaty_application/features/category_screens/vitamin/ui/vitamin_screen.dart';
import 'package:adweyaty_application/features/category_screens/woman_products/ui/woman_products_screen.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:adweyaty_application/features/home/presentation/widgets/grid_item_prototype.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});


  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: .34.sh,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: GridItemPrototype.categories.length,
          itemBuilder: (context,index) {
            return GridItemPrototype(index: index,);

          }
      ),
    );
  }
}
