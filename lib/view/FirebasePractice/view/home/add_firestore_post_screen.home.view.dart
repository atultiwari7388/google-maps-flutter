import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/widgets/round_button_widget.widget.dart';

class AddPostFirestoreScreen extends StatefulWidget {
  const AddPostFirestoreScreen({Key? key}) : super(key: key);

  @override
  State<AddPostFirestoreScreen> createState() => _AddPostFirestoreScreenState();
}

class _AddPostFirestoreScreenState extends State<AddPostFirestoreScreen> {
  final postController = TextEditingController();
  bool isLoading = false;

  final firestore = FirebaseFirestore.instance.collection("post");

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    postController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "What is in your mind ?",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            RoundButtonWidget(
              loading: isLoading,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                firestore.doc().set({
                  "title": postController.text.toString(),
                  "id": id,
                }).then((value) {
                  //success
                  setState(() {
                    isLoading = false;
                  });
                  AppUtils().toastSuccessMessage("Posted");
                }).onError((error, stackTrace) {
                  //Something went wrong
                  setState(() {
                    isLoading = false;
                  });
                  AppUtils().toastErrorMessage(error.toString());
                });
              },
              title: "Add",
            ),
          ],
        ),
      ),
    );
  }
}
