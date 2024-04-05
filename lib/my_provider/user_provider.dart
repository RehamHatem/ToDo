import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fire_base.dart';
import '../user_model.dart';


// class userprovider extends ChangeNotifier {
//   User? firebaseUser;
//   UserModel? userModel;
//
//   userprovider() {
//     firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser != null) {
//       initUser();
//     }
//   }
//
//   initUser() async {
//     userModel = await FirebaseFunctions.readUser();
//     notifyListeners();
//   }
// }

class userprovider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;

  userprovider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      firebaseUser = user;
      if (firebaseUser != null) {
        initUser();
      }
      notifyListeners();
    });
  }

  Future<void> initUser() async {
    userModel = await FirebaseFunctions.readUser();
    notifyListeners();
  }
}
