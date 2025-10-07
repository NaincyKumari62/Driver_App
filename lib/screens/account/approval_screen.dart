import 'dart:async';

import 'package:driver_app/res/Colors/color.dart';
import 'package:driver_app/screens/dashboard/dashboard_screen.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  
  @override
  void initState() {
    super.initState();
    
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 120.h,horizontal: 35.w),
          child: Column(
            children: [
              Image.asset('assets/images/approval_image.png'),
              SizedBox(height: 10.h,),
              BigText(text: 'Waiting For Approval',fontSize: 27.sp,),
              SizedBox(height: 7.h,),

              MediumText(text: 'Our team is reviewing your documents and will\nget back to you in 5-7 business days',fontSize: 12.sp,txtColor: AppColor.greyTextColor)
            ],
          ),
        ),
      ),
    );
  }
}
