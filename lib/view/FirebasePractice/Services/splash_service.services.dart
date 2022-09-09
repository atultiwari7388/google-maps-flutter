import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/auth/login_screen.auth.view.dart';

class FirebaseSplashServices {
  // check if user is login or not

  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FirebaseLoginScreen()),
          (route) => false);
    });
  }
}
