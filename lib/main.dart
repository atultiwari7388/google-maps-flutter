import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/googleMaps/get_user_current_location.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Rubik Regular",
      ),
      home: const GetCurrentUserLocationView(),
    );
  }
}
