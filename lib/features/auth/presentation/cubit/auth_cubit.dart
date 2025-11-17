import 'package:adweyaty_application/features/auth/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  createUserWithEmailAndPassword({required String emailAddress,required String password }){
    emit(AuthLoading());
    try{
      AuthRepo.createUserWithEmailAndPassword(emailAddress: emailAddress, password: password);
      emit(AuthSuccess());
    }
    catch(e){
      emit(AuthError());
    }
  }
}
