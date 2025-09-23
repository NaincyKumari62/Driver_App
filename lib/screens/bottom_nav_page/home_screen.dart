import 'package:driver_app/widgets/button/small_rounded_button.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/StudentCard/student_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> students = [
    {
      "name": "Arnav Mahanti",
      "address": "ABC Street, 123 Apartment, Kol",
      "image": "https://i.pravatar.cc/150?img=1",
    },
    {
      "name": "Arnav Mehta",
      "address": "ABC Street, 123 Apartment, Kol",
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Annette Black",
      "address": "ABC Street, 123 Apartment, Kol",
      "image": "https://i.pravatar.cc/150?img=3",
    },
  ];

  /// har student ka status rahenga: "none", "pickup", "drop"
  late List<String> studentStatus;

  @override
  void initState() {
    super.initState();
    // by default sabhi ka status none
    studentStatus = List.filled(students.length, "pickup");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              BigText(text: 'Hello, ', fontSize: 22.sp),
              BigText(text: 'Driver_name', fontSize: 17.sp),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            // Top Section
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFAFAFA),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                        text: 'ETA to next stop - 6mins', fontSize: 14.sp),
                    SmallRoundedButton(
                      cWidth: 90.w,
                      cHeight: 30.h,
                      btnName: 'Live',
                      bgColor: const Color(0xff48C089),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: MediumText(text: "Students",txtColor: Colors.grey.shade700,),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final status = studentStatus[index];

                  // status ke hisaab se button color set
                  Color pickColor =
                  status == "pickup" ? Colors.black : Colors.grey;
                  Color dropColor =
                  status == "drop" ? Colors.black : Colors.grey;

                  return StudentCard(
                    name: student['name']!,
                    address: student['address']!,
                    imageUrl: student['image']!,
                    pickBtnColor: pickColor,
                    dropBtnColor: dropColor,
                    onPicked: () {
                      setState(() {
                        studentStatus[index] = "drop";
                      });
                    },
                    onDropped: () {
                      setState(() {
                        studentStatus[index] = "pickup";
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}