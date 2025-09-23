import 'package:driver_app/res/Colors/color.dart';
import 'package:driver_app/screens/account/approval_screen.dart';
import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/file_box/upload_file_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../widgets/text/big_text.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen2> {
  File? aadhaarImage;
  File? panImage;
  File? pccImage;
  File? dlImage;

  final picker = ImagePicker();

  Future<void> getImage(Function(File) onImagePicked) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Onboarding"),

        leadingWidth: 35.w,
        leading: Padding(
          padding:  EdgeInsets.only(left: 19),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           BigText(text: "Document Proof :",decoration: TextDecoration.underline,),
            SizedBox(height: 5.h),

            // Aadhaar Card
            BigText(text: "Aadhaar Card (back/front)", fontSize: 14.sp),
            SizedBox(height: 10.h),
            UploadFileBox(
              image: aadhaarImage,
              onTap: () => getImage((file) {
                setState(() {
                  aadhaarImage = file;
                });
              }),
            ),

            SizedBox(height: 16.h),

            // PAN Card
            BigText(text: "Pan Card", fontSize: 14.sp),
            SizedBox(height: 10.h),
            UploadFileBox(
              image: panImage,
              onTap: () => getImage((file) {
                setState(() {
                  panImage = file;
                });
              }),
            ),

            SizedBox(height: 16.h),

            // PCC
            BigText(text: "PCC - Police Verification Certificate", fontSize: 14.sp),
            SizedBox(height: 10.h),
            UploadFileBox(
              image: pccImage,
              onTap: () => getImage((file) {
                setState(() {
                  pccImage = file;
                });
              }),
            ),

            SizedBox(height: 16.h),

            // Driving License
            BigText(text: "Driving License", fontSize: 14.sp),
            SizedBox(height: 10.h),
            UploadFileBox(
              image: dlImage,
              onTap: () => getImage((file) {
                setState(() {
                  dlImage = file;
                });
              }),
            ),

            SizedBox(height: 24.h),

            CustomButton(
              text: 'Create Profile',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ApprovalScreen()));
              },
              bgColor: AppColor.black,
            ),
            SizedBox(height: 30.h,)
          ],
        ),
      ),
    );
  }
}

