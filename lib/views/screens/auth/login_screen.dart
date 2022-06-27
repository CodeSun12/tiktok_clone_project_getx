import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone_project_getx/constants.dart';
import 'package:tiktok_clone_project_getx/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone_project_getx/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TikTok Clone App",
              style: TextStyle(fontSize: 35, color: buttonColor, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 15.0,),
            const Text(
              "Login",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                myController: emailController,
                labelText: "Email",
                icon: Icons.email_outlined,
              ),
            ),
            const SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                myController: passwordController,
                labelText: "Password",
                icon: CupertinoIcons.lock_shield_fill,
                isObscure: true,
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                authController.loginUser(emailController.text, passwordController.text);
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don\'t have an account ",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: (){
                    print("navigate to other screen");
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: buttonColor, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
