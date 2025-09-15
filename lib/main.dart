import 'package:driver_app/screens/login_screen.dart';
import 'package:driver_app/screens/otp_verification.dart';
import 'package:driver_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
      SplashScreen(),
    //  LoginScreen()
    // OtpVerification()


      );
  }
}
