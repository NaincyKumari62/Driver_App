import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

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
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8.0,
        backgroundColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.bottomNavColor,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.house,),

            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.banknote),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(

            icon: Icon(LucideIcons.file_clock),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.headset),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
