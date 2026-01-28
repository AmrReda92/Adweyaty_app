import 'package:adweyaty_application/features/auth/data/models/login_model.dart';
import 'package:adweyaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:adweyaty_application/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {

  static Future<UserModel>  createUserWithEmailAndPassword({ required SignUpModel model })async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

    final uid = credential.user!.uid ;
    final UserModel userWithUid = UserModel(
        name: model.name,
        email: model.email,
        phone: model.phone,
        uid: uid,
    );

      await FirebaseFirestore.instance.
      collection("users").doc(credential.user!.uid).set(userWithUid.toJson());

    return userWithUid ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw('The account already exists for that email.');
      }
      else{
        throw Exception('Auth error: ${e.message}');
      }
    } catch (e) {
      throw('something went wrong');
    }

  }

  static Future<UserModel>  signInWithEmailAndPassword({required LoginModel model })async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password,
      );

      final uid = credential.user!.uid ;
      final userDoc = await FirebaseFirestore.instance.collection("users").
      doc(uid).get();

      if(userDoc.exists){
        final Map<String,dynamic> userData =userDoc.data()!;
        return UserModel.fromJson(userData);
      }else{
        throw ("user is not in firebase");
      }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw('Wrong password provided for that user.');
      }else{
        throw('something went wrong');
      }
    }catch(e){
      throw Exception("Unknown error: $e");
    }
  }

  Future<void> sendResetPasswordEmail(String email) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }


}