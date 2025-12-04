class SignUpModel {

 final  String name ;
 final String phone ;
 final String email ;
 final String password ;

  SignUpModel({ required this.password , required this.name,required this.phone, required this.email,});


  Map<String,dynamic> toJson() {
   return
      {
       "name" : name,
       "mobile" : phone,
       "email" : email
      };
  }
}