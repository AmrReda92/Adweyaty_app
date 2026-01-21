import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favourite_item_model.dart';
import '../../data/repo/favourite_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepo repo;

  FavouriteCubit(this.repo) : super(FavouriteInitial());


  // ➕ ADD
  Future<void> addFavourite(FavouriteItemModel item) async {
    try {
      emit(FavouriteLoading());
      await repo.addToFavourite(uid: uid, item: item);
      emit(FavouriteAdded());
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }

  // ❌ REMOVE
  Future<void> removeFavourite(FavouriteItemModel item) async {
    try {
      emit(FavouriteLoading());
      await repo.removeFromFavourite(uid: uid, item: item);
      emit(FavouriteRemoved());
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }
  // نفس أسلوب CartCubit
  String get uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw "user is not logged in";
    } else {
      return user.uid;
    }
  }

  Future<void> moveToCart(FavouriteItemModel item) async {
    try {
      emit(FavouriteLoading());

      await repo.removeFromFavourite(
        uid: uid,
        item: item,
      );

      emit(FavouriteAddedToCart());
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }



  Stream<List<FavouriteItemModel>> getFavourites() {
    return repo.getFavourites(uid);
  }
}
