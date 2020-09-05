import 'package:bmi_calculator/resources/contants.dart';
import 'package:flutter/material.dart';
import 'contants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn({this.gender,this.iconData});
  final IconData iconData;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
