import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/MultiRoleBaseApp/multi_role_base_app.dart';
import 'package:flutter_bootcamp/view/MultiRoleBaseApp/second_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  //check if user is login or not

  void isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = sharedPreferences.getBool("isLogin") ?? false;

    if (isLogin) {
      Timer(
        const Duration(seconds: 8),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MultiRoleBaseApp()),
            (route) => false),
      );
    } else {
      Timer(
        const Duration(seconds: 8),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SecondLoginScreen()),
            (route) => false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.maxFinite,
        fit: BoxFit.cover,
        image: NetworkImage(
            "https://images.pexels.com/photos/8473212/pexels-photo-8473212.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),
    );
  }
}
