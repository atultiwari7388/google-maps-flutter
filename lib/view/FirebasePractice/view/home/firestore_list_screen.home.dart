import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/add_firestore_post_screen.home.view.dart';
import '../../Services/AuthServices/auth_services.dart';

class FirestoreListScreen extends StatefulWidget {
  const FirestoreListScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreListScreen> createState() => _FirestoreListScreenState();
}

class _FirestoreListScreenState extends State<FirestoreListScreen> {
  final FirebaseAuthService authService = FirebaseAuthService();

  final editController = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection("post").snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("post");

  Future<void> logout() async {
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
        title: const Text("Firestore Screen"),
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
      body: Column(
        children: [
          //fetch data using Expanded widget
          // Expanded(
          //   child: StreamBuilder(
          //       stream: ref.onValue,
          //       builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //         Map<dynamic, dynamic> map =
          //             snapshot.data!.snapshot.value as dynamic;
          //         List<dynamic> list = [];
          //         list.clear();
          //         list = map.values.toList();
          //         if (snapshot.hasData) {
          //           return ListView.builder(
          //             itemCount: snapshot.data!.snapshot.children.length,
          //             itemBuilder: (context, index) {
          //               return ListTile(
          //                 title: Text(list[index]["title"]),
          //                 subtitle: Text(list[index]["id"]),
          //               );
          //             },
          //           );
          //         } else {
          //           return const Center(
          //             child: Text("No data found"),
          //           );
          //         }
          //       }),
          // ),

          //fetch data using firebaseAnimatedList
          const SizedBox(height: 20),

          StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong !"),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        showMyDialog(editController.text.toString(),
                            snapshot.data!.docs[index].id.toString());

                        //for deleting the query
                        // ref
                        //     .doc(snapshot.data!.docs[index]["id"].toString())
                        //     .delete();
                      },
                      title:
                          Text(snapshot.data!.docs[index]["title"].toString()),
                      subtitle: Text(snapshot.data!.docs[index].id.toString()),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AddPostFirestoreScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }

  //create dialog box

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update"),
          content: Container(
            child: TextField(
              controller: editController,
              decoration: const InputDecoration(hintText: "Edit"),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                ref.doc(id).update({
                  "title": title,
                }).then((value) {
                  //success
                  AppUtils().toastSuccessMessage("Updated");
                }).onError((error, stackTrace) {
                  AppUtils().toastErrorMessage(error.toString());
                });
              },
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
