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

   const List<HomeCategoryModel> homeCategoryModel =
[
    HomeCategoryModel(id:"0",image: AppImages.coughMedicines, title: "cough medicines"),
    HomeCategoryModel(id:"1",image: AppImages.headache, title: "headache medicines"),
    HomeCategoryModel(id:"2",image: AppImages.temperature, title: "temperature medicines"),
    HomeCategoryModel(id:"3",image: AppImages.womanProduct, title: "woman products"),
    HomeCategoryModel(id:"4",image: AppImages.vitamin, title: "vitamin medicines"),
    HomeCategoryModel(id:"4",image: AppImages.bloodPressure, title: "pressure medicines"),
];
