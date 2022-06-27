import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_project_getx/constants.dart';

class UploadVideoController extends GetxController{

  // TODO Compress Video
  _uploaddVideoToStorage(String id, String videoPath) async{
    Reference ref = firebaseStorage.ref().child("videos").child(id);
    ref.putFile(File(videoPath));
  }



  // TODO Upload Video Function
  uploadVideo(String songName, String caption, String videoPath) async{
    try{
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc = await fireStore.collection("users").doc().get();

      // Get Id
      var allDocs = await fireStore.collection("videos").get();
      int len = allDocs.docs.length;
      _uploaddVideoToStorage("Video $len", videoPath);
    }catch(e){
      print(e.toString());
    }
  }
}