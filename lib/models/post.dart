import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postUrl;
  final String username;
  final String postId;
  final datePublished;
  final String profileImage;
  final dynamic likes;

  const Post({
    required this.description,
    required this.uid,
    required this.postUrl,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.profileImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "postUrl": postUrl,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    "profileImage": profileImage,
    "likes": likes,
  };

  // this function is converting map DocumentSnapshot data to map format for users.
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      postUrl: snapshot['postUrl'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      profileImage: snapshot['profileImage'],
      likes: snapshot['likes'],
    );
  }
}
