
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String upp = '';
  String down = '';
  String exp = '';
  List<String> history = [];
  String lastNum = '';
  final List<String> L = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        upp = '';
        down = '';
      } else if (value == '=') {
        try {
          upp = down;
          Parser p = Parser();
          Expression exp = p.parse(upp.replaceAll('×', '*').replaceAll('÷', '/').replaceAll('e', '2.718281828459045').replaceAll('π', '3.141592653589793').replaceAll('log','ln'));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          down = eval.toString();
          history.add('$upp = $down');
        } catch (e) {
          down = 'Error';
        }
      } else {
        if (value == '⌫' && down.isNotEmpty) {
          down = down.substring(0, down.length - 1);
        } else {
          if (value == '√') {
            value = 'sqrt(';
          }

          if (L.contains(value)) {
            lastNum += value;
          } else {
            lastNum = '';
          }

          if (value != '⌫') {
            down += value;
          }
        }
      }
    });
  }
  void showHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF222222), // Dark background
          title: Text(
            'History',
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            width: double.maxFinite,
            child: history.isEmpty
                ? Text(
                    'No history available',
                    style: TextStyle(color: Colors.white70),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          history[index],
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.lightBlueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Clear', style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                // Clear history logic here, you can call setState if needed
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildButton(String label, {Color color = Colors.white,Color color2=const Color.fromARGB(255, 74, 74, 74) ,double width = 67, double height = 68, bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () => buttonPressed(label),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(22),
            backgroundColor: color2,
            foregroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 22,
              fontWeight: bold ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    upp,
                    style: TextStyle(fontSize: 32, color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                    child: Text(
                      down,
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey[700]),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xFF2B2B2B),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('⌫', color: const Color.fromARGB(255, 82, 255, 238), bold: true,color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('C', color: const Color.fromARGB(255, 82, 255, 238), color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('÷', color: const Color.fromARGB(255, 82, 255, 238), color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('-', color: const Color.fromARGB(255, 82, 255, 238), color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('+', color: const Color.fromARGB(255, 82, 255, 238), color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('×', color: const Color.fromARGB(255, 82, 255, 238), color2: const Color.fromARGB(31, 82, 255, 238)),
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('('),
                    buildButton(')'),
                    buildButton('=', color: const Color.fromARGB(255, 0, 0, 0),color2: const Color.fromARGB(255, 82, 255, 238)),
                    buildButton('√'),
                    buildButton('^'),
                    buildButton('e'),
                    buildButton('π'),
                    buildButton('log', width: 100),
                    buildButton('sin', width: 100),
                    buildButton('cos', width: 100),
                    buildButton('tan', width: 100),
                    Padding(
                      padding: const EdgeInsets.all(7.5),
                      child: SizedBox(
                        width: 150,
                        height: 73,
                        child: ElevatedButton(
                          onPressed: () => showHistory(context),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(22),
                            backgroundColor: const Color.fromARGB(255, 74, 74, 74),
                            foregroundColor: const Color.fromARGB(255, 255, 173, 173),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
                          ),
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



