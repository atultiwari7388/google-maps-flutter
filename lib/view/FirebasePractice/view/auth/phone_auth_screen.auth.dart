import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/auth/verification_code_screen.view.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/widgets/round_button_widget.widget.dart';

class FirebasePhoneAuthenticationScreen extends StatefulWidget {
  const FirebasePhoneAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<FirebasePhoneAuthenticationScreen> createState() =>
      _FirebasePhoneAuthenticationScreenState();
}

class _FirebasePhoneAuthenticationScreenState
    extends State<FirebasePhoneAuthenticationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Enter your Phone Number.",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange.shade400),
            ),
            const SizedBox(height: 80),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "+91-8888888888",
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 50),
            RoundButtonWidget(
                title: "Send otp",
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: _phoneController.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        loading = false;
                      });
                      AppUtils().toastErrorMessage(e.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FirebasePhoneVerificationCodeScreen(
                            verificationId: verificationId,
                            phoneNumber: _phoneController.text,
                          ),
                        ),
                      );
                      setState(() {
                        loading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      AppUtils().toastErrorMessage(e.toString());
                      setState(() {
                        loading = false;
                      });
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
