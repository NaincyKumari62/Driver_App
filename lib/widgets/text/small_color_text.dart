import 'package:flutter/material.dart';

class SmallColorText extends StatelessWidget {
  final String text;
  final Color? color;

  const SmallColorText({
    super.key,
    required this.text,
     this.color

  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey.shade400

      ),);
  }
}