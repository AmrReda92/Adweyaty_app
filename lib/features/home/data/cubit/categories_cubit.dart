import 'package:adweyaty_application/features/home/data/home_repo/home_repo.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo ;
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  Future<void> getCategories()async{
    emit(CategoriesLoading());

    try{
     final categories = await homeRepo.getCategories();
     emit(CategoriesSuccess(categories));
    }catch(e){
      emit(CategoriesError('Failed to load categories'));
    }
  }


}
