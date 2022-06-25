import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
                "SignUp",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25,),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage("assets/images/user.png"),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  myController: usernameController,
                  labelText: "Username",
                  icon: Icons.person,
                ),
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
                ),
              ),
              const SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  print("Register User");
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
                      "Register",
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
                    "Already have an account ",
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: (){
                      print("navigate to other screen");
                    },
                    child: Text(
                      "Login",
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
