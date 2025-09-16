import 'package:driver_app/screens/otp_verification.dart';
import 'package:driver_app/widgets/input_field/phone_number_field.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:driver_app/widgets/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/button/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener((){
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height: 40),

                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/vehicle.png'),
                        ),

                        const SizedBox(height: 30),

                        MediumText(text: 'Enter Your Phone Number'),
                        const SizedBox(height: 5),

                        PhoneNumberField(
                          phoneController: phoneController,
                        ),

                        const SizedBox(height: 30),

                        CustomButton(
                          text: 'Continue',
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerification()));
                          },
                          bgColor: phoneController.text.trim().length == 10
                              ? Colors.black
                              : Colors.grey,
                        ),

                        const Spacer(), // Pushes SmallText to the bottom

                        SmallText(
                          text:
                          '''By signing up you agree to our terms and conditions. \nLearn how to use your data in our Privacy Policy.''',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
