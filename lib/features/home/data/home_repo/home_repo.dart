import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepo {
  final fireStore = FirebaseFirestore.instance ;

  Future<List<HomeCategoryModel>> getCategories () async{
    try{
      final snapshot = await fireStore.collection('categories').get();

      return snapshot.docs
          .map(
            (doc) => HomeCategoryModel.fromJson(doc.data(), doc.id),
      ).toList();
    }catch(e){
      throw Exception('Failed to load categories') ;
    }


  }

}