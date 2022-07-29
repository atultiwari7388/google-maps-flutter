import 'dart:math';

import 'package:flutter/material.dart';

class LotteryApp extends StatefulWidget {
  const LotteryApp({Key? key}) : super(key: key);

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  Random random = Random();
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottery App"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Lottery Winning Number is 45",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20),
            // Text(x > 5 ? "$x is greater than 5" : x.toString()),
            Container(
              height: 250,
              width: 300,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: x == 45
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.done,
                              color: Colors.green, size: 35.0),
                          const SizedBox(height: 15),
                          Text(
                            "Yay, your number is $x\n Congratulations 🥇, You have won the lottery",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.error,
                              color: Colors.red, size: 35.0),
                          const SizedBox(height: 15),
                          Text(
                            "Better luck next time, your number is $x\n try Again 😔",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          x = random.nextInt(100);
          print(x.toString());
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
