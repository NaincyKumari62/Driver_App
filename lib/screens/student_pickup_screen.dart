import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/button/small_rounded_button.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentPickupScreen extends StatefulWidget {
  const StudentPickupScreen({super.key});

  @override
  State<StudentPickupScreen> createState() => _StudentPickupScreenState();
}

class _StudentPickupScreenState extends State<StudentPickupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              BigText(text: 'Hello, ', fontSize: 20.sp),
              BigText(text: 'Driver_name', fontSize: 16.sp),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            // top section
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(color: Color(0xffFAFAFA)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: 'ETA to next stop - 6mins', fontSize: 14.sp),

                    SmallRoundedButton(
                      cWidth: 90.w,
                      cHeight: 30.h,
                      btnName: 'Live',
                      bgColor: Color(0xff48C089),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
