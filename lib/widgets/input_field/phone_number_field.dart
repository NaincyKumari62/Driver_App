import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController phoneController;
  const PhoneNumberField({
    super.key,
    required this.phoneController
  });

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedFlag = '🇮🇳';
  String selectedCode = '+91';

  final List<Map<String, String>> countries = [
    {'flag': '🇮🇳', 'code': '+91'},
    {'flag': '🇺🇸', 'code': '+1'},
    {'flag': '🇬🇧', 'code': '+44'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Flag Dropdown FIRST
          // DropdownButtonHideUnderline(
          //   child: DropdownButton<Map<String, String>>(
          //     value: countries.firstWhere((c) => c['code'] == selectedCode),
          //     items: countries.map((country) {
          //       return DropdownMenuItem<Map<String, String>>(
          //         value: country,
          //         child: Text(country['flag']!),
          //       );
          //     }).toList(),
          //     onChanged: (newCountry) {
          //       setState(() {
          //         selectedFlag = newCountry!['flag']!;
          //         selectedCode = newCountry['code']!;
          //       });
          //     },
          //   ),
          // ),

          SizedBox(width: 4),

          Text(selectedCode, style: TextStyle(fontSize: 16)),

          SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: widget.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'XXXXXXXXXX',
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
