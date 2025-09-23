import 'package:dotted_border/dotted_border.dart';
import 'package:driver_app/res/Colors/color.dart';
import 'package:driver_app/widgets/Tile/custom_tile.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/text/big_text.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.white],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Image.asset('assets/images/earn.png'),
                    Positioned(
                      left: 12.w,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                          BigText(
                            text: 'Refer & Earn',
                            txtColor: Color(0xff181C2E),
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      left: 30.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: '₹0',
                            txtColor: Color(0xff181C2E),
                            fontSize: 25.sp,
                          ),
                          MediumText(text: 'Total Rewards Earned'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    //invite and wallet section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1.1,
                        dashPattern: [2, 2],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10.r),
                        padding: EdgeInsets.zero,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 20.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.cardBgColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              _iconAndTextWidget(
                                'assets/images/invite_img.png',
                                'Invite your Friend to install the app with\nthe link',
                              ),
                              SizedBox(height: 10.h),
                              _iconAndTextWidget(
                                'assets/images/car.png',
                                'Your friend completes 5 trips with\nGrnLYFT',
                              ),
                              SizedBox(height: 10.h),
                              _iconAndTextWidget(
                                'assets/images/wallet.png',
                                'You get 150rs Cashback Instantly',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
          
                    // button
                    SizedBox(height: 20.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff075E54),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/whatsApp.png'),
                            SizedBox(width: 10.w),
                            MediumText(
                              text: 'Invite on WhatsApp',
                              txtColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(height: 10.h),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 30),
          
                    // Redeem Gift Voucher
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Redeem Gift Voucher",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          MediumText(text: 'You can redeem one unique code per account'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7F7F7),
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: Color(0xffC6C3C3),
                                    )
                                  ),
                                  child: Center(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        suffixIcon: Container(
                                          height: 35,
                                          width: 50,
                                          margin:  EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: const Icon(Icons.arrow_forward, color: Colors.white),
                                        ) ,
                                        hintText: "Enter Code",
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 12,vertical: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                            ],
                          ),
                          const SizedBox(height: 10),
                          BigText(text: 'Your Rewards')
                        ],
                      ),
                    ),

                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _iconAndTextWidget(String image, String title) {
  return Row(
    children: [
      Material(
        elevation: .5,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Image.asset(image),
          ),
        ),
      ),
      SizedBox(width: 5.w),
      MediumText(
        text: title,
        fontSize: 13.sp,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}
