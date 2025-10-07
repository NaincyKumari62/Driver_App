import 'package:driver_app/screens/profile_details/bank_details.dart';
import 'package:driver_app/screens/profile_details/refer_earn_screen.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/screens/profile_details/profile_info.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/Colors/color.dart';
import '../../widgets/Tile/custom_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Profile",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500),),
        leadingWidth: 40.w,
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(
              context,
              tiles: [
                CustomTile(
                  icon: LucideIcons.user,
                  iconColor: AppColor.icon_person,
                  title: 'Personal Info',
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileInfo() ));
                  },
                ),

                CustomTile(
                  icon: LucideIcons.smile_plus,
                  iconColor: AppColor.icon_smile,
                  title: "Bank Details",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BankDetailsScreen()),
                    );
                  },
                ),
                CustomTile(
                  icon: LucideIcons.gift,
                  iconColor: AppColor.icon_gift,
                  title: "Refer & Earn",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>  ReferEarnScreen()),
                    );
                  },
                ),
                CustomTile(
                  icon: LucideIcons.receipt_text,
                  iconColor: AppColor.icon_slip,
                  title: "Salary Slips",
                  onTap: () {

                  },
                ),

              ],
            ),

            _buildSection(
              context,
              tiles: [
                CustomTile(
                  icon: LucideIcons.file_text,
                  iconColor:  AppColor.icon_terms,
                  title: "Terms & Conditions",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                CustomTile(
                  icon: LucideIcons.scale,
                  iconColor: AppColor.icon_legal,
                  title: "Legal",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                CustomTile(
                  icon: LucideIcons.file_key,
                  iconColor: AppColor.icon_privacy,
                  title: "Privacy Policy",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
              ],
            ),
            _buildSection(
              context,
              tiles: [
                CustomTile(
                  icon: LucideIcons.log_out,
                  iconColor: AppColor.icon_logout,
                  title: "Log Out",
                  onTap: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each section with common styling
  Widget _buildSection(BuildContext context, {required List<Widget> tiles}) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: tiles),
    );
  }
}
