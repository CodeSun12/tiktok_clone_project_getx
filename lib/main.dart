import 'package:flutter/material.dart';
import 'package:tiktok_clone_project_getx/constants.dart';
import 'package:tiktok_clone_project_getx/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone_project_getx/views/screens/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: SignUpScreen(),
    );
  }
}
