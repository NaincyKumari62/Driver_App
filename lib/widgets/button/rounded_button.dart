import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this. bgColor ,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.elevation = 2.0,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color:  bgColor,
        ),
        child: Center(
          child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),

      ),
    );
  }
}
