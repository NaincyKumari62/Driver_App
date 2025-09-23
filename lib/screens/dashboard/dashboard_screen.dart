import 'package:flutter/material.dart';

import '../../res/Colors/color.dart';
import '../bottom_nav_page/attendance_screen.dart';
import '../bottom_nav_page/earning_screen.dart';
import '../bottom_nav_page/home_screen.dart';
import '../bottom_nav_page/profile_screen.dart';
import '../bottom_nav_page/support_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    EarningScreen(),
    AttendanceScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Show selected tab's screen
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8.0,
        backgroundColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.fontGrey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_nav_home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex==1?Image.asset('assets/images/earning.png',color: Colors.blue,): Image.asset('assets/images/earning.png'),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex==2? Image.asset('assets/images/attendance.png',color: Colors.blue,):
            Image.asset('assets/images/attendance.png'),
            label: 'Attendance',
          ),
           BottomNavigationBarItem(
            icon:Image.asset("assets/images/bottom_nav_support.png"),
            label: 'Support',
          ),
           BottomNavigationBarItem(
            icon:Image.asset("assets/images/bottom_nav_home.png"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
