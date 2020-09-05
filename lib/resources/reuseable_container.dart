import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.colour, this.containerchild });
  final Color colour;
  final Widget containerchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: containerchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
