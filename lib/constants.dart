import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone_project_getx/controllers/auth_controller.dart';
import 'package:tiktok_clone_project_getx/views/screens/add_video_screen.dart';

// TODO COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// TODO Storing the Firebase Instances in Local Variables
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

// TODO AuthController Class Instance
var authController = AuthController.instance;


// TODO Pages
const pages = [
  Text("Home Screen"),
  Text("Search Screen"),
  AddVideoScreen(),
  Text("Message Screen"),
  Text("Profile Screen"),
];