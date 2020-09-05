import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}