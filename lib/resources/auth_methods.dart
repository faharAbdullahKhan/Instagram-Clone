import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // for adding user to database
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signing up user
  Future<String> signUpUSer(
      {required String email,
      required String password,
      required String userName,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user with firebase
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
            email: email,
            uid: credential.user!.uid,
            userName: userName,
            photoUrl: photoUrl,
            followers: [],
            following: [],
            bio: bio);

        // adding user to database
        await _firestore.collection('users').doc(credential.user!.uid).set(user.toJson());

        // if dont want to use user.uid

        // await _firestore.collection('users').add({
        //   'username': userName,
        //   'uid': credential.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'followings': [],
        // });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// login user

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
