import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/widgets/round_button_widget.widget.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();

  bool isLoading = false;
  //for creating table || node
  final databseRef = FirebaseDatabase.instance.ref("Post");

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
                databseRef
                    .child(DateTime.now().millisecondsSinceEpoch.toString())
                    .set({
                  "title": postController.text.toString(),
                  "id": DateTime.now().millisecondsSinceEpoch.toString()
                }).then((value) {
                  AppUtils().toastSuccessMessage("Post Added");
                  setState(() {
                    isLoading = false;
                  });
                }).onError((error, stackTrace) {
                  AppUtils().toastErrorMessage(error.toString());
                  setState(() {
                    isLoading = false;
                  });
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
