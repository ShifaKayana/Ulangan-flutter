import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String display = '0';
  double num1 = 0;
  String operator = '';
  Color backgroundColor = const Color.fromARGB(255, 46, 35, 35);

  void _onPressed(String text) {
    setState(() {
      if (text == 'C') {
        display = '0';
        operator = '';
      } else if (text == '+' || text == '-' || text == '*' || text == '/') {
        num1 = double.parse(display);
        operator = text;
        display = '0';
      } else if (text == '=') {
        double num2 = double.parse(display);
        if (operator == '+') {
          display = (num1 + num2).toString();
        } else if (operator == '-') {
          display = (num1 - num2).toString();
        } else if (operator == '*') {
          display = (num1 * num2).toString();
        } else if (operator == '/') {
          display = (num1 / num2).toString();
        }
        operator = '';
      } else {
        if (display == '0') {
          display = text;
        } else {
          display += text;
        }
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onPressed(text),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24.0),
                alignment: Alignment.centerRight,
                child: Text(display, style: TextStyle(fontSize: 48)),
              ),
            ),
            Row(
              children: <Widget>[
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('0'),
                _buildButton('C'),
                _buildButton('='),
                _buildButton('+'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
