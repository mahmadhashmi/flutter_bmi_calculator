import 'package:flutter/material.dart';

class BMICards extends StatefulWidget {

  final Color cardColor;
  final Widget? cardChild;

  BMICards({required this.cardColor, this.cardChild});

  @override
  State<BMICards> createState() => _BMICardsState();
}

class _BMICardsState extends State<BMICards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.cardChild,
      ),
    );
  }
}