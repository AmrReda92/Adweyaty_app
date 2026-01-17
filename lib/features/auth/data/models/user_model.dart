class UserModel {
  final String name ;
  final String email ;
  final String uid ;
  final String phone ;
  final String? profileImageUrl ;


  UserModel({required this.name ,required this.email,required this.uid,required this.phone,this.profileImageUrl});

  Map<String,dynamic> toJson(){
    return {
      "name" : name ,
      "email" : email,
      "uid" : uid,
      "phone" : phone,
      "profileImageUrl": profileImageUrl,
    };
  }

  factory UserModel.fromJson (Map<String,dynamic> json ){
   return UserModel(
     profileImageUrl :json["profileImageUrl"] ,
       name: json["name"],
       email: json["email"],
        uid: json["uid"],
       phone: json["phone"],
   );
  }

  UserModel copyWith({String? profileImageUrl}) {
    return UserModel(
        name: name,
        email: email,
        uid: uid,
        phone: phone,
        profileImageUrl : profileImageUrl??  this.profileImageUrl
    );
  }
}

