import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/sign_up_model.dart';
import '../../../../data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  createUserWithEmailAndPassword({required SignUpModel model })async{
    emit(SignUpLoading());
    try{
      await   AuthRepo.createUserWithEmailAndPassword(model: model);
      emit(SignUpSuccess());
    }
    catch(e){
      emit(SignUpError(e.toString()));
    }
  }
}


/*
import 'package:adweyaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:adweyaty_application/features/auth/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  createUserWithEmailAndPassword({required SignUpModel model })async{
    emit(AuthLoading());
    try{
   await   AuthRepo.createUserWithEmailAndPassword(model: model);
      emit(AuthSuccess());
    }
    catch(e){
      emit(AuthError(e.toString()));
    }
  }
 */