import 'package:flutter/material.dart';
import 'contants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle,@required this.onTap});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle
          ),
        ),
      ),
    );;
  }
}
