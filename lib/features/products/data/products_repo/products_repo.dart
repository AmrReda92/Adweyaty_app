import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/drug_item_details.dart';

class ProductsRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance ;

  Future<List<DrugItemDetails>> getProductsByCategory(String categoryId) async{

    try{
      final snapshot = await fireStore.collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      return snapshot.docs
          .map(
            (doc) => DrugItemDetails.fromJson(doc.data(), doc.id),)
          .toList();

    }catch(e){
      throw Exception('Failed to load products') ;
    }
  }

}