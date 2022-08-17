import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/utils/routes_name.utils.dart';

class NavRouteView extends StatefulWidget {
  // static const String id = "/main-screen";
  const NavRouteView({Key? key}) : super(key: key);

  @override
  State<NavRouteView> createState() => _NavRouteViewState();
}

class _NavRouteViewState extends State<NavRouteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        centerTitle: true,
        elevation: 1.0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 1.0,
            minimumSize: const Size(350, 47),
          ),
          onPressed: () {
            //  Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const SecondRouteView(),
            //   ),
            // ),

            // Navigator.pushNamed(
            //   context,
            //   SecondRouteView.id,
            //   arguments: {
            //     "Name": "Screen 2",
            //     "page_id": 2,
            //   },
            // );

            Navigator.pushNamed(context, RouteName.secondRouteScreen,
                arguments: "Screen 2");
          },
          child: const Text("Go To Second Screen"),
        ),
      ),
    );
  }
}
