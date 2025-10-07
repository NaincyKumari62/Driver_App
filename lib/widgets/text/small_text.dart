import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  final String text;
  const SmallText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: 12.sp,

    ),);
  }
}
