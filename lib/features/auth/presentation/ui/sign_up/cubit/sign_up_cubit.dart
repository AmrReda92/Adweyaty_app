import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
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
     final user = await AuthRepo.createUserWithEmailAndPassword(model: model);
      emit(SignUpSuccess(user));
    }
    catch(e){
      emit(SignUpError(e.toString()));
    }
  }
}


