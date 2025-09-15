import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



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

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding"),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details :",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
              ),
              SizedBox(height: 16),

              // Upload Photo
              Text("Upload your passport size photo"),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: getImage,
                  child: Column(
                    children: [
                      _image == null
                          ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.upload_file, size: 20),
                      )
                          : Image.file(_image!, height: 30, width: 20),
                      SizedBox(height: 8),
                      Text("Drag & Drop or",style: TextStyle(fontSize:16 ),),
                      GestureDetector(
                        onTap: (){

                          },
                        child: Text("Choose file",style: TextStyle(fontSize: 16,color: Colors.blue),),
                      ),
                      Text("jpg, png, jpeg", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              _buildTextField("Name", nameController),
              _buildTextField("Mobile Number", mobileController,
                  keyboardType: TextInputType.phone),
              _buildTextField("Date of Birth", dobController,
                  keyboardType: TextInputType.datetime),

              SizedBox(height: 16),
              Text("Residential Address*", style: TextStyle(fontWeight: FontWeight.bold)),
              _buildTextField("Line 1", address1Controller),
              _buildTextField("Line 2", address2Controller),

              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedState,
                      decoration: InputDecoration(
                        labelText: "State",
                        border: OutlineInputBorder(),
                      ),
                      items: [
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
                    child: _buildTextField("Postal Code", postalController),
                  ),
                ],
              ),

              SizedBox(height: 16),
              _buildTextField("Bank Account Number", bankAccountController),
              _buildTextField("Bank Account Holder Name", holderNameController),
              _buildTextField("Bank Name", bankNameController),
              _buildTextField("Branch Name", branchNameController),
              _buildTextField("IFSC Code", ifscController),

              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Submit data or go to next screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form Submitted")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text("Save & Next", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
