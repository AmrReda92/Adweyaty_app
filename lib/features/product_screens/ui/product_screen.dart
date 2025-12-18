import 'package:adweyaty_application/features/product_screens/data/cubit/products_cubit.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/medicine_details_card.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductScreen extends StatelessWidget {
  final HomeCategoryModel categoryProduct;

  const ProductScreen({super.key, required this.categoryProduct});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        appBar: CustomAppbarCategory(title: categoryProduct.title),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if(state is ProductsLoading){
              return const Center(child: CircularProgressIndicator());
            }

            else if(state is ProductsError){
              return Center(child: Text(state.message));
            }

            else if(state is ProductsSuccess){
              if(state.products.isEmpty){
                return const Center(
                  child: Text("No products for this category yet"),
                );
              }else{
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 14.w,
                        childAspectRatio: .75
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final item = state.products[index];
                      return MedicineDetailsCard(drugItem: item);
                    }

                );
              }
            }
            return const SizedBox();
          },
        )


    );
  }
}
