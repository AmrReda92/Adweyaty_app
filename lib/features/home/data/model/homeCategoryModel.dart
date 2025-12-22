import '../../../../core/app_images/app_images.dart';

class HomeCategoryModel {

   final String title ;
   final String image ;
   final String id ;

  const HomeCategoryModel({required this.id, required this.image ,required this.title});


   factory HomeCategoryModel.fromJson ( Map<String,dynamic>json,String docId) {
     return HomeCategoryModel(
         id: docId,
         image: json["image"],
         title: json["title"]
     );
   }
}


