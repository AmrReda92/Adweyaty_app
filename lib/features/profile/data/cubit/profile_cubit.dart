import 'dart:io';

import 'package:adweyaty_application/features/profile/data/repo/profile_photo_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profilePhotoRepo) : super(ProfileInitial());

  final ProfilePhotoRepo _profilePhotoRepo ;

  Future<void> uploadProfileImage({required File image})async{
    try {
      emit(ProfileLoading());
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final imageUrl = await _profilePhotoRepo.uploadProfileImage(
              uid: uid,
              image: image
          );
      emit(ProfileSuccess(imageUrl));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

}
