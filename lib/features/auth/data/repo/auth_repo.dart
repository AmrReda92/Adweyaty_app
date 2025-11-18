import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {

 static createUserWithEmailAndPassword({required String emailAddress,required String password })async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw('The account already exists for that email.');
      }
    } catch (e) {
      throw('something went wrong');
    }
  }

  static signInWithEmailAndPassword({required String emailAddress,required String password })async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw('Wrong password provided for that user.');
      }else{
        throw('something went wrong');
      }
    }
  }


}