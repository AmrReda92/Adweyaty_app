import 'package:adweyaty_application/features/product_screens/data/models/drug_item_details.dart';
import 'package:adweyaty_application/features/product_screens/data/products_repo/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo ;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> getProductsByCategory (String categoryId )async{
    emit(ProductsLoading());
    try{
     final products = await productsRepo.getProductsByCategory(categoryId);
     emit(ProductsSuccess(products));
    }catch(e){
      emit(ProductsError('Failed to load products'));
    }
  }
}
