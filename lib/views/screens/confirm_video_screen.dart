import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone_project_getx/constants.dart';
import 'package:tiktok_clone_project_getx/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends StatefulWidget {
  ConfirmVideoScreen({required this.videoFile, this.videoPath});


  // TODO This is used for playing video
  final File videoFile;
  final String? videoPath;

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  late VideoPlayerController controller;
  TextEditingController songController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
           const SizedBox(height: 30,),
           SizedBox(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height/1.5,
             child: VideoPlayer(controller),
           ),
           const SizedBox(height: 30,),
           SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   margin: const EdgeInsets.symmetric(horizontal: 10),
                   width: MediaQuery.of(context).size.width - 20,
                   child: TextInputField(
                     myController: songController,
                     labelText: "Song Name",
                     icon: Icons.music_note,
                   ),
                 ),
                 const SizedBox(height: 10,),
                 Container(
                   margin: const EdgeInsets.symmetric(horizontal: 10),
                   width: MediaQuery.of(context).size.width - 20,
                   child: TextInputField(
                     myController: captionController,
                     labelText: "Caption",
                     icon: Icons.closed_caption_off,
                   ),
                 ),
                 const SizedBox(height: 10,),
                 MaterialButton(
                   onPressed: (){},
                   color: buttonColor,
                   child: const Text("share", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                 )
               ],
             ),
           )
         ],
        ),
      )
    );
  }
}
