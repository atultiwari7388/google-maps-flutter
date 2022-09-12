import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/Services/AuthServices/auth_services.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/add_post_screen.view.dart';

class FirebaseHomeScreen extends StatefulWidget {
  const FirebaseHomeScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseHomeScreen> createState() => _FirebaseHomeScreenState();
}

class _FirebaseHomeScreenState extends State<FirebaseHomeScreen> {
  final FirebaseAuthService authService = FirebaseAuthService();

  void logout() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No"),
            ),
            TextButton(
              style: TextButton.styleFrom(primary: Colors.green),
              onPressed: () {
                authService.logoutUser(context);
              },
              child: const Text("Yes"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        elevation: 1.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => logout(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddPostScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
