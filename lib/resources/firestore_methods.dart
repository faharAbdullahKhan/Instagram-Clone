import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/post.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //upload Post
  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "Some error occurred";

    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("posts", file, true);

      // v1 generates unique id based on time
      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postUrl: photoUrl,
        profileImage: profileImage,
        postId: postId,
        datePublished: DateTime.now(),
        likes: [],
      );

      // posting post data on firebase with collection name posts and document name with postId
      _firebaseFirestore.collection("posts").doc(postId).set(post.toJson());
      res = "success";

    } catch (error) {
      res = error.toString();

    }

    return res;
  }
}
