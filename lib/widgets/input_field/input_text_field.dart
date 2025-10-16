import 'package:driver_app/res/Colors/color.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final bool? isHintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool readOly;


  const InputTextField({
    super.key,
     this.controller,
    required this.hintText,
    this.isHintText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixIcon,  this.readOly=false,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOly,
      keyboardType: widget.textInputType,
      style: TextStyle(
        fontSize: 14.sp,
          color: AppColor.black
      ),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        hintText: widget.isHintText == true ? widget.hintText : null,
        hintStyle: TextStyle(
            fontSize: 14.sp,
          color: AppColor.greyTextColor
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.onboardingBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.red),
        ),
      ),
    );
  }
}
