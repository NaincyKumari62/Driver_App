import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const BigText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize ),);
  }
}
