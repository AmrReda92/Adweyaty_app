

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/repo/waleet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepo repo;
  WalletCubit(this.repo) : super(WalletInitial());

  String get uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw "User is not logged in";
    } else {
      return user.uid;
    }
  }

  //  نجيب الرصيد كـ Stream علشان UI يتحدث تلقائي
  Stream<num> getBalance() {
    return repo.getBalance(uid);
  }


  Future<void> addBalance(num amount) async {
    try {
      emit(WalletLoading());
      await repo.addBalance(
        uid: uid,
        amount: amount,
      );
      emit(WalletSuccess());
    } catch (e) {
      emit(WalletError(e.toString()));
    }
  }


  Future<void> spendBalance(num amount) async {
    try {
      emit(WalletLoading());
      await repo.spendBalance(
        uid: uid,
        amount: amount,
      );
      emit(WalletSuccess());
    } catch (e) {
      emit(WalletError(e.toString()));
    }
  }
}
