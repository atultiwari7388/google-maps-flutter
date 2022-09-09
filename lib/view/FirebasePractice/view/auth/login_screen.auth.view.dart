import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/Services/AuthServices/auth_services.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/auth/signup_screen.auth.view.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/widgets/round_button_widget.widget.dart';

class FirebaseLoginScreen extends StatefulWidget {
  const FirebaseLoginScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseLoginScreen> createState() => _FirebaseLoginScreenState();
}

class _FirebaseLoginScreenState extends State<FirebaseLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FirebaseAuthService authService = FirebaseAuthService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          centerTitle: true,
          elevation: 1.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, color: Colors.deepOrange),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _passController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock, color: Colors.deepOrange),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    RoundButtonWidget(
                      title: "Login",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          //successful
                          authService.userLogin(
                              context,
                              _emailController.text.toString(),
                              _passController.text.toString());
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FirebaseSignUpScreen(),
                                  ),
                                ),
                            child: const Text("Sign up")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
