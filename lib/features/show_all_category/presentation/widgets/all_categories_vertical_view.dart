import 'package:adweyaty_application/features/home/data/cubit/categories_cubit.dart';
import 'package:adweyaty_application/features/show_all_category/presentation/widgets/card_item_all_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_show_dialogue.dart';


class AllCategoriesVerticalView extends StatelessWidget {
  const AllCategoriesVerticalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
      if (state is CategoriesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      else if (state is CategoriesError) {
        return Center(child: Text(state.message));
      }

      else if (state is CategoriesSuccess) {
        final categories = state.categories;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final item = categories[index];
              return CardItemAllCategory(category: item);
            }
        );
       }
      return const SizedBox();
      },
    );
  }
}
