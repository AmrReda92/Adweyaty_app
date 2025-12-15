import 'package:adweyaty_application/features/auth/data/models/login_model.dart';
import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signInWithEmailAndPassword({required LoginModel model })async{
    emit(LoginLoading());
    try{
      final user =  await AuthRepo.signInWithEmailAndPassword(model : model);
      emit(LoginSuccess(user));
    }
    catch(e){
      emit(LoginError(e.toString()));
    }
  }
}
