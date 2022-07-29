import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterImportantWidgets extends StatelessWidget {
  const FlutterImportantWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff764abc)),
                accountName: Text("Atul Tiwari"),
                accountEmail: Text("tiwariatul9526@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://scontent.fvns1-2.fna.fbcdn.net/v/t39.30808-6/287050572_416302713738486_4490321749476732365_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=rjoBx4lzojwAX9VaEbd&_nc_ht=scontent.fvns1-2.fna&oh=00_AT_w-74W47WJQqbxg1eDUj03Kjumv1hdxfxVnOD-1J654A&oe=62E7088B"),
                )),
            ListTile(
              title: Text("Home"),
              leading: FaIcon(FontAwesomeIcons.house),
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 40),
            //container widget
            // Center(
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: const BorderRadius.only(
            //         topRight: Radius.circular(40),
            //         topLeft: Radius.circular(0),
            //         bottomRight: Radius.circular(0),
            //         bottomLeft: Radius.circular(30),
            //       ),
            //       border: Border.all(color: Colors.blue, width: 5),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.green,
            //           blurRadius: 1.0,
            //           offset: Offset(4, 5),
            //         ),
            //       ],
            //     ),
            //     child: const Center(
            //       child: Text("Container 1"),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Center(
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     transform: Matrix4.rotationZ(.3),
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       image: const DecorationImage(
            //         image: NetworkImage(
            //             "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallsdesk.com%2Fwp-content%2Fuploads%2F2017%2F01%2FWhite-Dandelion-Photos.jpg&f=1&nofb=1"),
            //         fit: BoxFit.fitHeight,
            //       ),
            //       borderRadius: const BorderRadius.only(
            //         topRight: Radius.circular(10),
            //         topLeft: Radius.circular(10),
            //         bottomRight: Radius.circular(10),
            //         bottomLeft: Radius.circular(10),
            //       ),
            //       border: Border.all(color: Colors.blue, width: 3),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.green,
            //           blurRadius: 1.0,
            //           offset: Offset(1, 1),
            //         ),
            //       ],
            //     ),
            //     child: const Center(
            //       child: Text("Container 2"),
            //     ),
            //   ),
            // ),

            // Row , Expanded, SingleChildScrollView Widgets

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   physics: BouncingScrollPhysics(),
            //   padding: EdgeInsets.all(5.0),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //       ),
            //       SizedBox(width: 10),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //       ),
            //       SizedBox(width: 10),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //       ),
            //       SizedBox(width: 10),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //       ),
            //     ],
            //   ),
            // ),

            // Expanded && Flexible Widget
            //row widget
            // Row(
            //   children: [
            //     // Expanded(
            //     //   child: Container(
            //     //     height: 200,
            //     //     // width: 100,
            //     //     color: Colors.red,
            //     //   ),
            //     // ),
            //     // Expanded(
            //     //   child: Container(
            //     //     height: 200,
            //     //     // width: 100,
            //     //     color: Colors.green,
            //     //   ),
            //     // ),
            //
            //     // Flexible(
            //     //   child: Container(
            //     //     height: 200,
            //     //     // width: 100,
            //     //     color: Colors.red,
            //     //   ),
            //     // ),
            //     // Flexible(
            //     //   child: Container(
            //     //     height: 200,
            //     //     width: 100,
            //     //     color: Colors.green,
            //     //   ),
            //     // ),
            //   ],
            // ),

            //ListTile Widget
            //Stack Widget

            // Stack(
            //   children: [
            //     Positioned(
            //       top: 40,
            //       child: Container(
            //         height: 150,
            //         width: 300,
            //         color: Colors.red,
            //       ),
            //     ),
            //     Container(
            //       height: 150,
            //       width: 250,
            //       color: Colors.green,
            //     ),
            //     Container(
            //       height: 150,
            //       width: 200,
            //       color: Colors.blue,
            //     ),
            //   ],
            // ),

            //Circular avatar widget
            //circleAvatar
            // Center(
            //   child: CircleAvatar(
            //     radius: 100,
            //     backgroundColor: Colors.red,
            //     backgroundImage: NetworkImage(
            //         "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FzyHbBwq1vAs%2Fmaxresdefault.jpg&f=1&nofb=1"),
            //   ),
            // ),
            //
            // //Divider
            // Divider(
            //   color: Colors.red,
            //   thickness: 3,
            // ),
            // SizedBox(
            //   height: 100,
            //   child: VerticalDivider(
            //     color: Colors.green,
            //     thickness: 3,
            //   ),
            // ),
            // Divider(
            //   color: Colors.blue,
            //   thickness: 3,
            // ),

            //ListTile Widget
            // ListTile(
            //   leading: CircleAvatar(
            //     radius: 30,
            //     backgroundImage: NetworkImage(
            //         "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftimesofindia.indiatimes.com%2Fphoto%2F59148341.cms&f=1&nofb=1"),
            //   ),
            //   title: Text("Pappu"),
            //   subtitle: Text("Ed side se alu dusre side se sona 😁"),
            //   trailing: Text("03:35 PM"),
            // ),

            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 15, left: 5, right: 5),
                    child: const ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftimesofindia.indiatimes.com%2Fphoto%2F59148341.cms&f=1&nofb=1"),
                      ),
                      title: Text("Pappu "),
                      subtitle: Text("Ek side se alu dusre side se sona 😁"),
                      trailing: Text("03:35 PM"),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
