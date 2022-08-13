import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/MultiRoleBaseApp/multi_role_base_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondLoginScreen extends StatefulWidget {
  const SecondLoginScreen({Key? key}) : super(key: key);

  @override
  State<SecondLoginScreen> createState() => _SecondLoginScreenState();
}

class _SecondLoginScreenState extends State<SecondLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Age",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                hintText: "Password",
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

                  sharedPref.setString(
                      "email", _emailController.text.toString());
                  sharedPref.setString("age", _ageController.text.toString());
                  sharedPref.setBool("isLogin", true);

                  //next screen
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiRoleBaseApp()),
                      (route) => false);
                },
                child: const Text(
                  "Login ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
