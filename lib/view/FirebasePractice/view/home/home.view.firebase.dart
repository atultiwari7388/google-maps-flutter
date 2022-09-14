import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/Services/AuthServices/auth_services.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/utils/app_utils.utils.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/home/add_post_screen.view.dart';

class FirebaseHomeScreen extends StatefulWidget {
  const FirebaseHomeScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseHomeScreen> createState() => _FirebaseHomeScreenState();
}

class _FirebaseHomeScreenState extends State<FirebaseHomeScreen> {
  final FirebaseAuthService authService = FirebaseAuthService();
  final ref = FirebaseDatabase.instance.ref("Post");
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: "Search......",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),

          Expanded(
            child: FirebaseAnimatedList(
                defaultChild: const Center(child: CircularProgressIndicator()),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final title = Text(snapshot.child("title").value.toString());
                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(snapshot.child("title").value.toString()),
                      subtitle: Text(snapshot.child("id").value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        itemBuilder: (context) => [
                          //
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                showMyDialog(title.toString(),
                                    snapshot.child("id").value.toString());
                              },
                              title: const Text("Edit"),
                              trailing: const Icon(Icons.edit_outlined),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                ref
                                    .child(
                                        snapshot.child("id").value.toString())
                                    .remove();
                              },
                              title: const Text("Delete"),
                              trailing: const Icon(Icons.delete_outline),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (title
                      .toString()
                      .toLowerCase()
                      .contains(searchFilter.text.toLowerCase().toString())) {
                    return ListTile(
                      title: Text(snapshot.child("title").value.toString()),
                      subtitle: Text(snapshot.child("id").value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
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
                ref.child(id).update(
                    {"title": editController.text.toString()}).then((value) {
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
