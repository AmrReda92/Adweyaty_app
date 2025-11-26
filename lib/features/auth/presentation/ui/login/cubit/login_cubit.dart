import 'package:adweyaty_application/features/auth/data/models/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signInWithEmailAndPassword({required LoginModel model })async{
    emit(LoginLoading());
    try{
      await   AuthRepo.signInWithEmailAndPassword(model : model);
      emit(LoginSuccess());
    }
    catch(e){
      emit(LoginError(e.toString()));
    }
  }
}
