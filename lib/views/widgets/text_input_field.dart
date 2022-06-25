import 'package:flutter/material.dart';
import 'package:tiktok_clone_project_getx/constants.dart';

class TextInputField extends StatelessWidget {

  TextEditingController myController = TextEditingController();
   bool? isObscure;
   String? labelText;
   IconData? icon;

   TextInputField({
     required this.myController,
     this.isObscure = false,
     required this.icon,
     required this.labelText,
});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            )
        ),
      ),
      obscureText: isObscure!,
    );
  }
}
