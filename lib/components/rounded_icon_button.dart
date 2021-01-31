import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, {@required this.onPressed});
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        //size: 40,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}
