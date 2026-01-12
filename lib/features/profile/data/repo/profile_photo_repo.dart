import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePhotoRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage(
      {required String uid, required File image}) async {
    final reference =
    storage.
    ref().
    child("users").
    child("uid").
    child("profile.jpg");

    await reference.putFile(image);

    final imageUrl = await reference.getDownloadURL();
    await fireStore.collection("users").doc("users").update(
        {"profileImageUrl": imageUrl});

    return imageUrl;
  }
}
