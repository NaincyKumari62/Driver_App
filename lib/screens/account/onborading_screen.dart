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
import 'student_details.dart';

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

  // String selectedState = 'State';
  String selectedState = '';

  Future<void> getImage(Function(File) onImagePicked) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }
  List<String> states = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya', 'Mizoram',
    'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu',
    'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal',
  ];


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
          padding: EdgeInsets.symmetric(horizontal:  17.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),

                Text(
                  'Personal Details :',
                  style: TextStyle(
                    fontSize: 18.sp ,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),

                SizedBox(height: 8.h),

                // Upload Photo
                MediumText(
                  text: "Upload your passport size photo",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
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
                SizedBox(height: 10.h),
                BigText(text: 'Name*', fontSize: 14.sp, fontWeight: FontWeight.w400,txtColor: AppColor.black,),
                SizedBox(height: 4.h),

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
                SizedBox(height: 10.h),
                BigText(
                    text: 'Mobile Number*',
                    fontSize: 14.sp, fontWeight: FontWeight.w400,txtColor: AppColor.black
                ),   SizedBox(height: 4.h),
                InputTextField(
                  controller: mobileController,
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
                SizedBox(height: 10.h),
                BigText(
                  text: 'Date of Birth*',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 4.h),
                InputTextField(
                  controller: dobController,
                  isHintText: true,
                  readOly: true,


                  textInputType: TextInputType.datetime,
                  hintText: 'DD/MM/YYYY',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xff6B6B6B),
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,

                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      builder:
                          (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.grey,
                              // ✅ Change highlight color (selected date)
                              onPrimary: Colors.white,
                              // ✅ Text color on selected date
                              onSurface: Colors.black, // ✅ Default text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors
                                    .grey, // ✅ Button text color (Cancel, OK)
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      };

                      if (pickedDate != null) {
                        // Format date as DD/MM/YYYY
                        String formattedDate =
                            "${pickedDate.day.toString().padLeft(2, '0')}/"
                            "${pickedDate.month.toString().padLeft(2, '0')}/"
                            "${pickedDate.year}";
                        dobController.text = formattedDate;

                      }
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Date of Birth";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                BigText(
                    text: 'Residential Address*',
                    fontSize: 14.sp, fontWeight: FontWeight.w400,txtColor: AppColor.black
                ),
                SizedBox(height: 4.h),
                InputTextField(
                  controller: address1Controller,
                  hintText: 'Line 1',
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
                  hintText: 'Line 2',
                  isHintText: true,
                ),


SizedBox(height: 10.h,),
                Row(
                  children: [

                    Expanded(

                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,

                        value: selectedState.isNotEmpty ? selectedState : null,
                        items: states.map((String value) {
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
                        decoration: InputDecoration(
                          hintText: "State",
                          fillColor: Colors.white,
                          filled: true,

                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                          isDense: true,

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.onboardingBorder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.grey),
                          ),

                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),

                    Expanded(
                      flex: 1,
                      child: InputTextField(
                        controller: postalController,
                        hintText: "Postal Code",
                        isHintText: true,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter postal code";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Save & Next',
                  onPressed: () {

                    if(_formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>StudentDetails()));
                    }
                  },
                  bgColor: AppColor.black,
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}