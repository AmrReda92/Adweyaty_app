
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
