import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/Services/splash_service.services.dart';

class FirebaseSplashScreen extends StatefulWidget {
  const FirebaseSplashScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseSplashScreen> createState() => _FirebaseSplashScreenState();
}

class _FirebaseSplashScreenState extends State<FirebaseSplashScreen> {
  FirebaseSplashServices splashServices = FirebaseSplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
