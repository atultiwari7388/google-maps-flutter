import 'package:flutter/material.dart';

class SecondRouteView extends StatefulWidget {
  // static const String id = "/screen-two";
  final String pageName;
  const SecondRouteView({Key? key, required this.pageName}) : super(key: key);

  @override
  State<SecondRouteView> createState() => _SecondRouteViewState();
}

class _SecondRouteViewState extends State<SecondRouteView> {
  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
        centerTitle: true,
        elevation: 1.0,
        // automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          "Welcome to Second Screen",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
