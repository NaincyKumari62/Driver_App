import 'package:driver_app/screens/approval_screen.dart';
import 'package:driver_app/screens/login_screen.dart';
import 'package:driver_app/screens/onboarding2.dart';
import 'package:driver_app/screens/onborading_screen.dart';
import 'package:driver_app/screens/otp_verification.dart';
import 'package:driver_app/screens/splash_screen.dart';
import 'package:driver_app/screens/student_pickup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: StudentPickupScreen(),
      ),
    );
  }
}
