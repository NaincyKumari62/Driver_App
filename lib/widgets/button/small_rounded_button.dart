
import 'package:flutter/material.dart';
class SmallRoundedButton extends StatelessWidget {
  final double cWidth;
  final double cHeight;
  final String btnName;
  final Color bgColor;
  final Color? textColor;
  final double? radius;
  final VoidCallback onPressed;

  const SmallRoundedButton({
    super.key,
    required this.cWidth,
    required this.cHeight,
    required this.btnName,
    required this.bgColor,
     this.textColor = const Color(0xffFFFFFF),
     this.radius = 20,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(radius!),
        child: Container(
          width: cWidth,
          height: cHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            color: bgColor,
          ),
          child: Center(
            child: Text(
              btnName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
