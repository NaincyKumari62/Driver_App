import 'package:driver_app/screens/account/approval_screen.dart';
import 'package:driver_app/screens/bottom_nav_page/attendance_screen.dart';
import 'package:driver_app/screens/dashboard/dashboard_screen.dart';
import 'package:driver_app/screens/account/login_screen.dart';
import 'package:driver_app/screens/account/onboarding2.dart';
import 'package:driver_app/screens/account/onborading_screen.dart';
import 'package:driver_app/screens/account/otp_verification.dart';
import 'package:driver_app/screens/profile_details/bank_details.dart';
import 'package:driver_app/screens/profile_details/edit_profile_screen.dart';
import 'package:driver_app/screens/profile_details/profile_info.dart';
import 'package:driver_app/screens/bottom_nav_page/profile_screen.dart';
import 'package:driver_app/screens/profile_details/refer_earn_screen.dart';
import 'package:driver_app/screens/splash_screen.dart';
import 'package:driver_app/screens/bottom_nav_page/home_screen.dart';
import 'package:driver_app/screens/bottom_nav_page/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Driver App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
