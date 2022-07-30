import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/constants/color.constants.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorAppView extends StatefulWidget {
  const CalculatorAppView({Key? key}) : super(key: key);

  @override
  State<CalculatorAppView> createState() => _CalculatorAppViewState();
}

class _CalculatorAppViewState extends State<CalculatorAppView> {
  var userInput = "";
  var answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              //user area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: headingText.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        answer.toString(),
                        style: headingText.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomButton(
                            text: "AC",
                            onTap: () {
                              userInput = "";
                              answer = "";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "+/-",
                            onTap: () {
                              userInput += "+/-";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "%",
                            onTap: () {
                              userInput += "%";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "/",
                            color: Colors.red,
                            onTap: () {
                              userInput += "/";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            text: "7",
                            onTap: () {
                              userInput += "7";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "8",
                            onTap: () {
                              userInput += "8";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "0",
                            onTap: () {
                              userInput += "0";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "x",
                            color: Colors.red,
                            onTap: () {
                              userInput += "*";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            text: "4",
                            onTap: () {
                              userInput += "4";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "5",
                            onTap: () {
                              userInput += "5";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "6",
                            onTap: () {
                              userInput += "6";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "-",
                            color: Colors.red,
                            onTap: () {
                              userInput += "-";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            text: "1",
                            onTap: () {
                              userInput += "1";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "2",
                            onTap: () {
                              userInput += "2";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "3",
                            onTap: () {
                              userInput += "3";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "+",
                            color: Colors.red,
                            onTap: () {
                              userInput += "+";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                            text: "0",
                            onTap: () {
                              userInput += "0";
                              setState(() {});
                            }),
                        CustomButton(
                            text: ".",
                            onTap: () {
                              userInput += ".";
                              setState(() {});
                            }),
                        CustomButton(
                            text: "DEL",
                            onTap: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        CustomButton(
                            text: "=",
                            color: Colors.red,
                            onTap: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.color = const Color(0xffa5a5a5),
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                text,
                style: subHeadingText.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
