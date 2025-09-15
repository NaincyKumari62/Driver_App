import 'dart:io';
import 'package:flutter/material.dart';

class UploadFileBox extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const UploadFileBox({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xffFAFDFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE4EDF4)),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              image == null
                  ? Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/upload_file.png',
                ),
              )
                  : Image.file(image!, height: 30, width: 20),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Drag & Drop or ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Choose file",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    " to upload",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Text(
                "jpg, png, jpeg",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
