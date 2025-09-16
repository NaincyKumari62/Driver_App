import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/file_box/upload_file_box.dart';
import '../widgets/input_field/input_text_field.dart';
import '../widgets/text/big_text.dart';
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
        backgroundColor: Colors.white,
        title: Text("Onboarding"),
        leadingWidth: 35,
        leading: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'Personal Details :'),
              SizedBox(height: 5),

              // Upload Photo
              MediumText(text: "Upload your passport size photo"),
              SizedBox(height: 10),
              UploadFileBox(
                image: _image,
               onTap: ()=>getImage((file){
                 setState(() {
                   _image = file;
                 });
               }) ,
              ),
              SizedBox(height: 16),

              BigText(text:'Name',fontSize: 16,fontWeight: FontWeight.w500,),
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
              BigText(text:'Mobile Number',fontSize: 16,fontWeight: FontWeight.w500,),
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

              BigText(text:'Date of Birth',fontSize: 16,fontWeight: FontWeight.w500,),
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

              SizedBox(height: 16),
              Text(
                "Residential Address*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
             InputTextField(controller: address1Controller, hintText: 'Line1',   isHintText: true,),
              SizedBox(height: 5,),
              InputTextField(controller: address2Controller, hintText: 'Line2',   isHintText: true,),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedState,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffF0F2F5), width: 2), // 👈 focused border color
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffF0F2F5), width: 2), // 👈 focused border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey), // 👈 enabled border color
                        ),
                        border: OutlineInputBorder(
                        ),
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
                  SizedBox(width: 10),
                  Expanded(
                    child: InputTextField(hintText: "Postal Code",controller:  postalController, isHintText: true,),
                  ),
                ],
              ),

              SizedBox(height: 16),
              BigText(text:"Bank Account Number",fontSize: 16,fontWeight: FontWeight.w500,),
              InputTextField(hintText: "Bank Account Number",controller:  bankAccountController),
              BigText(text:"Bank Account Holder Name",fontSize: 16,fontWeight: FontWeight.w500,),
              InputTextField(hintText: "Bank Account Holder Name",controller:  holderNameController),
              BigText(text:"Bank Name",fontSize: 16,fontWeight: FontWeight.w500,),
              InputTextField(hintText: "Bank Name", controller: bankNameController),
              BigText(text:"Branch Name",fontSize: 16,fontWeight: FontWeight.w500,),
              InputTextField(hintText: "Branch Name",controller:  branchNameController),
              BigText(text:"IFSC Code",fontSize: 16,fontWeight: FontWeight.w500,),
              InputTextField(hintText: "IFSC Code",controller:  ifscController,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter IFSC Code";
                }
                return null;
              },),

              SizedBox(height: 24),
               CustomButton(text: 'Save & Next', onPressed: (){
                 if(_formKey.currentState!.validate()){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                 }

                // Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
               }, bgColor: Colors.black),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
