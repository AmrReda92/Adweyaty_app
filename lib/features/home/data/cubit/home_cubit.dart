import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void loadUserData({required UserModel userDataLoaded}){
    emit(HomeDataSuccess(userDataLoaded));
  }
}
