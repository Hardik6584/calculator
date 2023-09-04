import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
// this math_expression package to use the answer of math all solutions
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // input & output number values
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

// click button to action perform logic
  onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser parser = Parser();
        Expression expression = parser.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = false;
        outputSize = 30;
      }
    } else {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // answer area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          // button area
          Row(
            children: [
              button(
                text: "AC",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "=",
                textColor: Colors.white,
                buttonBgColor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "7",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "8",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "9",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "x",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "4",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "5",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "6",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "-",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "1",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "2",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "3",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "+",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "%",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "0",
                textColor: Colors.white,
                buttonBgColor: operatorColor,
              ),
              button(
                text: ".",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
              button(
                text: "/",
                textColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
        ],
      ),
    );
  }


// button widget to use show all buttons
  Widget button({
    text,
    textColor = Colors.white,
    buttonBgColor = buttonColor,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
          ),
          // button logic
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
