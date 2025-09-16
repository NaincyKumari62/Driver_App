import 'package:driver_app/screens/login_screen.dart';
import 'package:driver_app/screens/onborading_screen.dart';
import 'package:driver_app/widgets/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/button/rounded_button.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  late String otp;


  @override
  void initState() {
    super.initState();

    _otpController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Verify OTP',style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            SmallText(text: 'Enter the OTP Sent to your mobile number'),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: PinCodeTextField(
                controller: _otpController,
                appContext: context,
                length: 6,
                onChanged: (value) {
                  otp =value;
                },
                validator: (value){
                  if(value == null || value.isEmpty || value.length < 6){
                    return "Please enter a valid 6-digit OTP";
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 40,
                  fieldWidth: 43,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor:Colors.grey,
                  activeColor:Colors.grey,
                ),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
              ),
            ),

            SizedBox(height: 20),

            CustomButton(text: 'Verify', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
            }, bgColor: _otpController.text.length == 6? Colors.black:Colors.grey,)
          ],
        ),
      ),
    );
  }
}
