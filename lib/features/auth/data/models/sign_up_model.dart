class SignUpModel {

 final  String name ;
 final String mobile ;
 final String email ;
 final String password;

  SignUpModel({required this.name,required this.mobile, required this.email,required this.password});


  Map<String,dynamic> toJson() {
   return
      {
       "name" : name,
       "mobile" : mobile,
       "email" : email
      };
  }
}