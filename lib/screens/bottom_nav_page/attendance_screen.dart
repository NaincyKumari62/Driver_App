import 'package:driver_app/widgets/text/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:driver_app/widgets/button/small_rounded_button.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import '../../widgets/attendance table/attendance_table.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BigText(text: 'Attendance',fontSize: 25.sp,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAttendanceBox(),
            const SizedBox(height: 20),
            _buildCalendar(),
            const SizedBox(height: 20),
            const Text(
              "Attendance",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const AttendanceTable(), // ✅ Table moved here
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceBox() {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            text: "Mark attendance for today (${_formattedDate(DateTime.now())})",
            txtColor: const Color(0xff333333),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SmallRoundedButton(
                cWidth: 140.w,
                cHeight: 35.h,
                radius: 5.r,
                btnName: 'Check In',
                bgColor: Colors.black,
                onPressed: () {},
              ),
              SizedBox(width: 10.w),
              SmallRoundedButton(
                cWidth: 140.w,
                cHeight: 35.h,
                radius: 5.r,
                btnName: 'Check Out',
                bgColor: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10.h),
          MediumText(
            text: "Make sure your location is enabled while you check In",
            fontSize: 11.sp,
            txtColor: const Color(0xff333333),
          ),
        ],
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
    const months = [
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
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
