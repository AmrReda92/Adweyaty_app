import 'package:adweyaty_application/features/favourite/data/models/favourite_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteRepo {
  final FirebaseFirestore _firestore =FirebaseFirestore.instance ;

  CollectionReference getUserFavRef (String uid){
    return _firestore.
    collection("users").
    doc(uid).
    collection("favourites");
  }

  Future<void> addToFavourite({required String uid ,required FavouriteItemModel item })async{
    await getUserFavRef(uid).
    doc(item.productId).
    set(item.toJson());
  }

  Future<void> removeFromFavourite ({required String uid, required FavouriteItemModel item})async{
    await getUserFavRef(uid).doc(item.productId).delete();
  }

  Stream<List<FavouriteItemModel>> getFavourites(String uid){
    return getUserFavRef(uid).
    orderBy("added at",descending: true).
    snapshots().
    map((snapshot){
      List<FavouriteItemModel> favList=[];
      for(var doc in snapshot.docs){
        final data = doc.data as Map<String,dynamic> ;
        final item = FavouriteItemModel.fromJson(data);
        favList.add(item);
      }
      return favList;
    });
  }

  Future<bool> isFavourite ({required String uid ,required String productId})async{
    final favRefDoc = getUserFavRef(uid).doc(productId);
    final favSnapshot = await favRefDoc.get();

    if(favSnapshot.exists){
      return true ;  // المنتج موجود
    }else{
      return false;
    }
  }
}