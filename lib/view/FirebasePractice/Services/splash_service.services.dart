import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/auth/login_screen.auth.view.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/home.view.firebase.dart';

class FirebaseSplashServices {
  // check if user is login or not

  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 10), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const FirebaseHomeScreen()),
            (route) => false);
      });
    } else {
      //
      Timer(const Duration(seconds: 10), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const FirebaseLoginScreen()),
            (route) => false);
      });
    }
  }
}
