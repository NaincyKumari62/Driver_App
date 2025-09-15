import 'package:driver_app/widgets/button/rounded_button.dart';
import 'package:driver_app/widgets/file_box/upload_file_box.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/input_field/input_text_field.dart';
import '../widgets/text/big_text.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: 'Document Proof :'),
            SizedBox(height: 5),

            // Aadhaar Card
            BigText(text: "Aadhaar Card (back/front)", fontSize: 14),
            SizedBox(height: 10),
            UploadFileBox(
              image: aadhaarImage,
              onTap: () => getImage((file) {
                setState(() {
                  aadhaarImage = file;
                });
              }),
            ),

            SizedBox(height: 16),

            // PAN Card
            BigText(text: "Pan Card", fontSize: 14),
            SizedBox(height: 10),
            UploadFileBox(
              image: panImage,
              onTap: () => getImage((file) {
                setState(() {
                  panImage = file;
                });
              }),
            ),

            SizedBox(height: 16),

            // PCC
            BigText(text: "PCC - Police Verification Certificate", fontSize: 14),
            SizedBox(height: 10),
            UploadFileBox(
              image: pccImage,
              onTap: () => getImage((file) {
                setState(() {
                  pccImage = file;
                });
              }),
            ),

            SizedBox(height: 16),

            // Driving License
            BigText(text: "Driving License", fontSize: 14),
            SizedBox(height: 10),
            UploadFileBox(
              image: dlImage,
              onTap: () => getImage((file) {
                setState(() {
                  dlImage = file;
                });
              }),
            ),

            SizedBox(height: 24),

            CustomButton(
              text: 'Create Profile',
              onPressed: () {},
              bgColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

