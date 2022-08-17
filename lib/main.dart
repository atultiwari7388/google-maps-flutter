import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/navroute.navigationandrouting.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/secondroute_view.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/utils/routes.utils.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/utils/routes_name.utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Rubik Regular",
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const NavRouteView(),
      // initialRoute: NavRouteView.id,
      // routes: {
      //   NavRouteView.id: (context) => const NavRouteView(),
      //   SecondRouteView.id: (context) => const SecondRouteView(),
      // },

      initialRoute: RouteName.navRouteScreen,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
