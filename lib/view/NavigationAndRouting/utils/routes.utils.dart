import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/navroute.navigationandrouting.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/secondroute_view.dart';
import 'package:flutter_bootcamp/view/NavigationAndRouting/utils/routes_name.utils.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      //home-screen

      case RouteName.navRouteScreen:
        return MaterialPageRoute(
          builder: (context) => const NavRouteView(),
        );

      //second-screen

      case RouteName.secondRouteScreen:
        return MaterialPageRoute(
          builder: (context) =>
              SecondRouteView(pageName: settings.arguments as String),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Screen Found"),
            ),
          ),
        );
    }
  }
}
