import 'package:adweyaty_application/features/auth/data/repo/auth_repo.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/forget_password/cubit/reset_pass_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ResetPassCubit extends Cubit<ResetPassState> {
  final AuthRepo _repo ;
  ResetPassCubit(this._repo) : super(ResetPassInitial());

  Future<void> resetPassword  (String email)async{
    try{
      emit(ResetPassLoading());
      await _repo.sendResetPasswordEmail(email);
      emit(ResetPassSuccess());
    }catch(e){
      emit(ResetPassError(e.toString()));
    }
  }
}
