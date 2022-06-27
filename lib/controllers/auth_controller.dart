import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone_project_getx/constants.dart';
import 'package:tiktok_clone_project_getx/models/userModel.dart' as model;
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_project_getx/views/screens/home_screen.dart';
import 'package:tiktok_clone_project_getx/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone_project_getx/views/screens/auth/signup_screen.dart';

import '../models/userModel.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get profilePhoto => _pickedImage.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, setInitialScreen);
  }


  // TODO SetInitializeScreen for clearing all Things and Showing LoginScreen. Works like SharedPreference to save the state of currentuser to keep it login
  setInitialScreen(User? user){
    if(user == null){
      Get.offAll(() => LoginScreen());
    }else{
      Get.offAll(() => HomeScreen());
    }
  }

  // TODO Pick Image From Gallery or Camera\
  void pickImage() async{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      Get.snackbar("Profile Picture", "You have successfully selected your profile pic");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }


  // TODO Upload Image To Firebase Storage
  Future<String> _uploadToStorage(File image) async{
    Reference ref = firebaseStorage.ref().child("profilePics").child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // TODO Register User
  void registerUser(String username, String email, String password, File? img) async{
    try{
      if(
      username.isNotEmpty
          && email.isNotEmpty
          && password.isNotEmpty
          && img != null
      ){
        // Store User to Firebase Storage
         UserCredential cred =  await firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password);
         firebaseAuth.currentUser?.sendEmailVerification();
         String imageUrl = await _uploadToStorage(img);
         model.UserModel userModel = model.UserModel(
             name: username,
             email: email,
             profilePhoto: imageUrl,
             uid: cred.user!.uid,
         );
         await fireStore.collection("users").doc(cred.user!.uid).set(userModel.toJson());
         Get.snackbar("Check Your Email", "Email has send to your email for verification");
      }else{
        Get.snackbar("Account is not Created", "Please Provide All the required credentials");
      }
    }catch(e){
      Get.snackbar("Error Creating Account", e.toString());
    }
  }

  // TODO Login User
  void loginUser(String email, String password) async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        Get.to(HomeScreen());
      }else{
        Get.snackbar("Error", "Your Provide Fields are not correct");
      }
    }catch(e){
      Get.snackbar("Error in Login", e.toString());
    }
  }

}