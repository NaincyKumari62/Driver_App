import 'package:driver_app/res/Colors/color.dart';
import 'package:driver_app/screens/account/approval_screen.dart';
import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/file_box/upload_file_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../widgets/text/big_text.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<StudentDetails> {
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
        title: Text("Onboarding",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500),),
        leadingWidth: 40.w,
        leading: Padding(
          padding:  EdgeInsets.only(left: 5.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
             BigText(text: "Document Proof :",decoration: TextDecoration.underline,),
              SizedBox(height: 10.h),

              // Aadhaar Card
              BigText(text: "Aadhaar Card (back/front)*", fontSize: 14.sp),
              SizedBox(height: 8.h),
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
              BigText(text: "Pan Card*", fontSize: 14.sp),
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
              BigText(text: "PCC - Police Verification Certificate*", fontSize: 14.sp),
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
              BigText(text: "Driving License*", fontSize: 14.sp),
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
              SizedBox(height: 15.h,)
            ],
          ),
        ),
      ),
    );
  }
}

