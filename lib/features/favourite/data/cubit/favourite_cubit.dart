import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favourite_item_model.dart';
import '../../data/repo/favourite_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepo repo;

  FavouriteCubit(this.repo) : super(FavouriteInitial());

  // نفس أسلوب CartCubit
  String get uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw "user is not logged in";
    } else {
      return user.uid;
    }
  }

  Future<void> toggleFavourite(FavouriteItemModel item) async {
    try {
      emit(FavouriteLoading());

      final isFav = await repo.isFavourite(
        uid: uid,
        productId: item.productId,
      );

      if (isFav) {
        await repo.removeFromFavourite(
          uid: uid,
          item: item,
        );
      } else {
        await repo.addToFavourite(
          uid: uid,
          item: item,
        );
      }

      emit(FavouriteSuccess());
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }

  Stream<List<FavouriteItemModel>> getFavourites() {
    return repo.getFavourites(uid);
  }
}
