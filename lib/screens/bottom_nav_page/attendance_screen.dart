import 'package:driver_app/widgets/text/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:driver_app/widgets/button/small_rounded_button.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import '../../res/Colors/color.dart';
import '../../widgets/attendance table/attendance_table.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  Color bgColor1 = AppColor.black;
  Color bgColor2 = Color(0xff1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Attendance",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500),),
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
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAttendanceBox(bgColor1,bgColor2),

            _buildCalendar(),
             SizedBox(height: 20.h),
             Text(
              "Attendance",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10.h),
             AttendanceTable(), // ✅ Table moved here
          ],
        ),
      ),
    );
  }

  bool isCheckedIn = true;

  Widget _buildAttendanceBox(Color bgColor1, Color bgColor2) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediumText(
              text: "Mark attendance for today (${_formattedDate(DateTime.now())})",
              txtColor: AppColor.calenderTextColor,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: SmallRoundedButton(
                    cWidth: 140.w,
                    cHeight: 35.h,
                    radius: 5.r,
                    btnName: 'Check In',
                    bgColor: isCheckedIn ? AppColor.black : Color(0xffD3D3D3),
                    onPressed: () {
                      setState(() {
                        isCheckedIn = !true;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SmallRoundedButton(
                    cWidth: 140.w,
                    cHeight: 35.h,
                    radius: 5.r,
                    btnName: 'Check Out',
                    bgColor: !isCheckedIn ? AppColor.black : Color(0xffD3D3D3),
                    onPressed: () {
                      setState(() {
                        isCheckedIn = !false;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            MediumText(
              text: "Make sure your location is enabled while you check In",
              fontSize: 11.sp,
              txtColor: AppColor.calenderTextColor,
            ),
          ],
        ),
      ),
    );
  }


  String _formattedDate(DateTime date) {
    final day = date.day;
    final suffix = _getDaySuffix(day);
    final month = _monthName(date.month);
    final year = date.year;
    return "$day$suffix $month $year";
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return "th";
    switch (day % 10) {
      case 1: return "st";
      case 2: return "nd";
      case 3: return "rd";
      default: return "th";
    }
  }

  String _monthName(int month) {
    const  months = [
      '', // 0 index is unused
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec',
    ];
    return months[month];
  }


  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selected, focused) {
        setState(() {
          selectedDay = selected;
          focusedDay = focused;
        });
      },
      headerStyle:  HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle:  CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColor.black,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColor.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
