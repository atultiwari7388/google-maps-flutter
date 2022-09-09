import 'package:flutter/material.dart';

class FirebaseHomeScreen extends StatefulWidget {
  const FirebaseHomeScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseHomeScreen> createState() => _FirebaseHomeScreenState();
}

class _FirebaseHomeScreenState extends State<FirebaseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        elevation: 1.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
