import 'package:flutter/material.dart';
import 'dart:math';

void main() 
{
  runApp(Calculator());
}

class Calculator extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      theme: ThemeData.dark(),
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget 
{
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<Screen> 
{
  String _output = "0";
  String _result = "0";
  String? _operation;
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
  setState(() {
    if (buttonText == "C") {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operation = null;
      _result = "0";
    } 
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/" || buttonText == "^" || buttonText == "%") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _output = "0";
    } 
    else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operation != null) {
        switch (_operation) {
          case "+":
            _result = (_num1 + _num2).toString();
            break;
          case "-":
            _result = (_num1 - _num2).toString();
            break;
          case "*":
            _result = (_num1 * _num2).toString();
            break;
          case "%":
            _result = (sqrt(_num1)).toString();
            break;
          case "/":
            if (_num2 == 0) { 
              _result = "Ошибка";
            } else {
              _result = (_num1 / _num2).toString();
            }
            break;
          case "^":
            _result = pow(_num1, _num2).toString();
            break;
        }
      }
      _output = _result;
      _operation = null;
    } else {
      _output = _output == "0" ? buttonText : _output + buttonText;
    }
  });
}


  Widget _buildButton(String buttonText, Color color) 
  {
    return Expanded
    (
      child: Padding
      (
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton
        (
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom
          (
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          child: Text
          (
            buttonText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.black,
      body: Column
      (
        children: <Widget>
        [
          Container
          (
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text
            (
              _output,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Expanded
          (
            child: Divider(),
          ),
          Column
          (
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.grey),
                  _buildButton("", Colors.black),
                  _buildButton("%", Colors.orange),
                  _buildButton("/", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.grey[850] ?? Colors.grey),
                  _buildButton("8", Colors.grey[850] ?? Colors.grey),
                  _buildButton("9", Colors.grey[850] ?? Colors.grey),
                  _buildButton("*", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.grey[850] ?? Colors.grey),
                  _buildButton("5", Colors.grey[850] ?? Colors.grey),
                  _buildButton("6", Colors.grey[850] ?? Colors.grey),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.grey[850] ?? Colors.grey),
                  _buildButton("2", Colors.grey[850] ?? Colors.grey),
                  _buildButton("3", Colors.grey[850] ?? Colors.grey),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("0", Colors.grey[850] ?? Colors.grey),
                  _buildButton(".", Colors.grey[850] ?? Colors.grey),
                  _buildButton("=", const Color.fromARGB(255, 0, 255, 128)),
                  _buildButton("^", Colors.orange), 
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
