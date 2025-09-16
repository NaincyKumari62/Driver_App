import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const MediumText({
    super.key,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize
    ),);
  }
}
