import 'package:flutter/material.dart';
import 'pages/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Color(0xFFEA1556),
          primaryColor: Color(0xFF090C22),
          scaffoldBackgroundColor: Color(0xFF090C22)
      ),
      home: InputPage(),
    );
  }
}


