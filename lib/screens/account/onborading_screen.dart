import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../res/Colors/color.dart';
import '../../widgets/file_box/upload_file_box.dart';
import '../../widgets/input_field/input_text_field.dart';
import '../../widgets/text/big_text.dart';
import 'onboarding2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  File? _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final postalController = TextEditingController();
  final bankAccountController = TextEditingController();
  final holderNameController = TextEditingController();
  final bankNameController = TextEditingController();
  final branchNameController = TextEditingController();
  final ifscController = TextEditingController();

  String selectedState = 'Select State';

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
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Details :',
                style: TextStyle(
                  fontSize: 18.sp ,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),

              SizedBox(height: 5.h),

              // Upload Photo
              MediumText(
                text: "Upload your passport size photo",
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
              SizedBox(height: 10.h),
              UploadFileBox(
                image: _image,
                onTap: () => getImage((file) {
                  setState(() {
                    _image = file;
                  });
                }),
              ),
              SizedBox(height: 16.h),

              BigText(text: 'Name', fontSize: 16.sp, fontWeight: FontWeight.w500),
              InputTextField(
                isHintText: true,
                controller: nameController,
                hintText: 'Enter your full name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              BigText(
                text: 'Mobile Number',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                controller: nameController,
                isHintText: true,
                textInputType: TextInputType.number,
                hintText: 'Enter your mobile number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Mobile Number";
                  }
                  return null;
                },
              ),

              BigText(
                text: 'Date of Birth',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                controller: nameController,
                isHintText: true,
                textInputType: TextInputType.number,
                hintText: 'DD/MM/YYYY',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Date of Birth";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.h),
              Text(
                "Residential Address*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InputTextField(
                controller: address1Controller,
                hintText: 'Line1',
                isHintText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Residential Address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.h),
              InputTextField(
                controller: address2Controller,
                hintText: 'Line2',
                isHintText: true,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedState,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColor.onboardingBorder,
                            width: 2.w,
                          ), // focused border color
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.r),
                          borderSide: BorderSide(
                            color: AppColor.onboardingBorder,
                            width: 2.w,
                          ), // focused border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColor.grey,
                          ), // 👈 enabled border color
                        ),
                        border: OutlineInputBorder(),
                      ),
                      items:
                          [
                            'Select State',
                            'Delhi',
                            'Maharashtra',
                            'Karnataka',
                            'Uttar Pradesh',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedState = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: InputTextField(
                      hintText: "Postal Code",
                      controller: postalController,
                      isHintText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Postal Code";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              BigText(
                text: "Bank Account Number",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "Bank Account Number",
                controller: bankAccountController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Bank Account Number";
                  }
                  return null;
                },
              ),
              BigText(
                text: "Bank Account Holder Name",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "Bank Account Holder Name",
                controller: holderNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Account Holder Name";
                  }
                  return null;
                },
              ),
              BigText(
                text: "Bank Name",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "Bank Name",
                controller: bankNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Bank Name";
                  }
                  return null;
                },
              ),
              BigText(
                text: "Branch Name",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "Branch Name",
                controller: branchNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "PleaseBranch Name";
                  }
                  return null;
                },
              ),
              BigText(
                text: "IFSC Code",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "IFSC Code",
                controller: ifscController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter IFSC Code";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24.h),
              CustomButton(
                text: 'Save & Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OnboardingScreen2()),
                  );
                  // if(_formKey.currentState!.validate()){
                  //   Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                  // }
                },
                bgColor: AppColor.black,
              ),
              SizedBox(height: 27.h),
            ],
          ),
        ),
      ),
    );
  }
}
