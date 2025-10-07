import 'package:driver_app/widgets/button/button.dart';
import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/button/small_rounded_button.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;
  final Color pickBtnColor;
  final Color dropBtnColor;
  final VoidCallback onPicked;
  final VoidCallback onDropped;

  const StudentCard({
    Key? key,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.onPicked,
    required this.onDropped, required this.pickBtnColor, required this.dropBtnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF7F7F7),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:  15.h,horizontal: 12.w),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 20,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: name, fontSize: 16,txtColor: Color(0xff222222),),
                     MediumText(text: address,fontSize: 13.sp,txtColor: Colors.grey.shade700,)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SmallRoundedButton(
                    cWidth: 150.w,
                    cHeight: 33.h,
                    btnName: "Picked Up",
                    bgColor: pickBtnColor,
                    onPressed: () {
                      onPicked();
                    },
                    radius: 10.r,
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: SmallRoundedButton(
                    cWidth: 150.w,
                    cHeight: 33.h,
                    btnName: "Dropped",
                    bgColor: dropBtnColor,
                    onPressed: () {
                      onDropped();
                    },
                    radius: 10.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
