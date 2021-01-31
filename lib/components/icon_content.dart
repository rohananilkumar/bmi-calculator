import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final Icon icon;
  final String text;

  const IconContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
