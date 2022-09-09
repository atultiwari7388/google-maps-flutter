import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/home.view.firebase.dart';
import '../../widgets/round_button_widget.widget.dart';

class FirebasePhoneVerificationCodeScreen extends StatefulWidget {
  const FirebasePhoneVerificationCodeScreen(
      {Key? key, required this.verificationId})
      : super(key: key);
  final String verificationId;

  @override
  State<FirebasePhoneVerificationCodeScreen> createState() =>
      _FirebasePhoneVerificationCodeScreenState();
}

class _FirebasePhoneVerificationCodeScreenState
    extends State<FirebasePhoneVerificationCodeScreen> {
  final TextEditingController smsController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
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
              "Please Enter OTP we will send on +91",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange.shade400),
            ),
            const SizedBox(height: 80),
            TextFormField(
              controller: smsController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "6 digit code",
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 50),
            RoundButtonWidget(
              title: "verify",
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });

                final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: smsController.text.toString(),
                );

                try {
                  await auth.signInWithCredential(credential);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FirebaseHomeScreen()),
                      (route) => false);
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  AppUtils().toastErrorMessage(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
