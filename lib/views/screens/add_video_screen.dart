import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_project_getx/constants.dart';

import 'confirm_video_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  // TODO Pick Video Function
  pickVideo(ImageSource src, BuildContext context) async{
    final pickVideo = await ImagePicker().pickVideo(source: src);
    if(pickVideo != null){
      Get.to(ConfirmVideoScreen(
        videoFile: File(pickVideo.path),
        videoPath: pickVideo.path,
      ));
    }
  }


  showOptionsDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.gallery, context),
              child: Row(
                children: const [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Gallery", style: TextStyle(fontSize: 20, color: Colors.white),),
                  )

                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.camera, context),
              child: Row(
                children: const [
                  Icon(Icons.camera),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Camera", style: TextStyle(fontSize: 20, color: Colors.white),),
                  )

                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: Row(
                children: const [
                  Icon(Icons.cancel_outlined),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cancel", style: TextStyle(fontSize: 20, color: Colors.white),),
                  )

                ],
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text("Add Video", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
          ),
        ),
      ),
    );
  }
}
