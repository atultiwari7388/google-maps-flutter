import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/auth/login_screen.auth.view.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/home.view.firebase.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //signup
  Future<void> createAccount(
      String email, String password, BuildContext context) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        AppUtils().toastSuccessMessage("Account created successfully!");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const FirebaseHomeScreen()),
            (route) => false);
      }).onError((error, stackTrace) {
        AppUtils().toastErrorMessage(error.toString());
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      AppUtils().toastErrorMessage(e.toString());
    }
  }

  //login
  Future<void> userLogin(
      BuildContext context, String email, String password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        //login successfull
        AppUtils().toastSuccessMessage(
            "Welcome back ${firebaseAuth.currentUser!.email}");
      }).onError((error, stackTrace) {
        //something went wrong or email id && pass not found!;
        AppUtils().toastErrorMessage(error.toString());
      });
    } catch (e) {
      AppUtils().toastErrorMessage(e.toString());
    }
  }

  //logout
  Future<void> logoutUser(BuildContext context) async {
    try {
      await firebaseAuth.signOut().then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const FirebaseLoginScreen()),
            (route) => false);
      });
      AppUtils().toastSuccessMessage("Logout Successfully ");
    } catch (e) {
      AppUtils().toastErrorMessage(e.toString());
    }
  }
}
