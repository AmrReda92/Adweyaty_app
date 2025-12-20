import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/home/data/cubit/categories_cubit.dart';
import 'package:adweyaty_application/features/home/presentation/widgets/custom_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GridViewHorizontalItems extends StatelessWidget {
  const GridViewHorizontalItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .34.sh,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {

          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );

          } else if (state is CategoriesError) {
            return Center(child: Text(state.message));

          } else if (state is CategoriesSuccess) {
            final categories = state.categories;

            return GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.productScreen,
                      arguments: category,
                    );
                  },
                  child: CustomCategoryModel(category: category),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
