class UserModel {
  final String name ;
  final String email ;
  final String uid ;
  final String phone ;

  UserModel({required this.name ,required this.email,required this.uid,required this.phone});

  Map<String,dynamic> toJson(){
    return {
      "name" : name ,
      "email" : email,
      "uid" : uid,
      "phone" : phone,
    };
  }

  factory UserModel.fromJson (Map<String,dynamic> json ){
   return UserModel(
       name: json["name"],
       email: json["email"],
        uid: json["uid"],
       phone: json["phone"],
   );
  }
}

