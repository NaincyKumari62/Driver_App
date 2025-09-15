import 'package:driver_app/screens/onborading_screen.dart';
import 'package:driver_app/widgets/text/small_text.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Verify OTP',style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
