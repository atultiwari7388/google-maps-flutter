import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  Future<DateTime> futureFunction() async {
    await Future.delayed(const Duration(seconds: 4));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: futureFunction(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  );
                } else {
                  return const Text("Something Went Wrong !");
                }
              } else {
                return Text(
                  snapshot.connectionState.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w500),
                );
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          futureFunction();
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
