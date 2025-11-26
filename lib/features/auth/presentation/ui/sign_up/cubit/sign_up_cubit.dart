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
      await AuthRepo.createUserWithEmailAndPassword(model: model);
      emit(SignUpSuccess());
    }
    catch(e){
      emit(SignUpError(e.toString()));
    }
  }
}


