import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // adding images to Firebase
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {


    // Creating folder from the child name in Firebase
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);

    if(isPost){
      String id = const  Uuid().v1();
      // ref is exsisitng folder in firebase storage with a child name..
      // .. and child of user uid and with the child new id generated for the post
      ref = ref.child(id);
    }

    // Uploading image to the firebase
    UploadTask uploadTask = ref.putData(file);


    // Getting download Url for the image in the firebase
    TaskSnapshot snap  = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;


  }

}