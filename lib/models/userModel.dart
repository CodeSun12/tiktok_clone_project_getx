
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  String? name;
  String? email;
  String? profilePhoto;
  String? uid;

  UserModel({
   required this.name,
   required this.email,
   required this.profilePhoto,
   required this.uid,
});

  // ToMap is used to convert dart type data into Map or Json Type of data
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "profilePhoto": profilePhoto,
    "uid": uid,
  };

  // Will Provide the DocumentSnapshot of the Data Stored in Firebase Database for converting map/json type data into dart format data
  static UserModel fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid']
    );
  }

}