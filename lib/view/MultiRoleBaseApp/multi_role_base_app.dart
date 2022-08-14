import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/MultiRoleBaseApp/second_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiRoleBaseApp extends StatefulWidget {
  const MultiRoleBaseApp({Key? key}) : super(key: key);

  @override
  State<MultiRoleBaseApp> createState() => _MultiRoleBaseAppState();
}

class _MultiRoleBaseAppState extends State<MultiRoleBaseApp> {
  String email = "";
  String age = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email") ?? "";
    age = sharedPreferences.getString("age") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Multi Role Base App",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email : "),
                Text(
                  email.toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Age : "),
                Text(
                  age.toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
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
                  // ignore: use_build_context_synchronously
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
      ),
    );
  }
}
