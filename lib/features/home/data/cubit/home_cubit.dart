import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void loadUserData( UserModel userDataLoaded){
    emit(HomeDataSuccess(userDataLoaded));
  }

  void updateProfileImage(String imageUrl) {
    if (state is HomeDataSuccess) {
      final currentUser = (state as HomeDataSuccess).user;

      emit(
        HomeDataSuccess(
          currentUser.copyWith(profileImageUrl: imageUrl),
        ),
      );
    }
  }
}
