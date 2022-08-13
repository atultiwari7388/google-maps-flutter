import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/MultiRoleBaseApp/second_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiRoleBaseApp extends StatefulWidget {
  const MultiRoleBaseApp({Key? key}) : super(key: key);

  @override
  State<MultiRoleBaseApp> createState() => _MultiRoleBaseAppState();
}

class _MultiRoleBaseAppState extends State<MultiRoleBaseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Multi Role Base App",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 48), elevation: 1),
              onPressed: () async {
                //save user data to locally
                SharedPreferences sharedPref =
                    await SharedPreferences.getInstance();

                sharedPref.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondLoginScreen()),
                    (route) => false);

                //next screen
              },
              child: const Text(
                "Log out ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
