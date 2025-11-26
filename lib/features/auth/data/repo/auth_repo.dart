import 'package:adweyaty_application/features/auth/data/models/login_model.dart';
import 'package:adweyaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {

 static createUserWithEmailAndPassword({ required SignUpModel model })async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      await FirebaseFirestore.instance.
      collection("users").doc(credential.user!.uid).set(model.toJson());


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

  static signInWithEmailAndPassword({required LoginModel model })async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password,
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