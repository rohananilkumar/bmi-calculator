import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function handleOnTap;

  ReusableCard({@required this.color, this.cardChild, this.handleOnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleOnTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        margin: EdgeInsets.all(15),
        child: cardChild,
      ),
    );
  }
}
