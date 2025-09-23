
import 'package:driver_app/screens/profile_details/edit_profile_screen.dart';
import 'package:driver_app/widgets/text/big_text.dart';
import 'package:driver_app/widgets/text/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: BigText(text: 'Personal Info',txtColor: Color(0xff181C2E), fontSize: 20.sp,),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 15.w),
            child: TextButton( onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProfileScreen()));
            }, child: Text('EDIT',
              style: TextStyle(
                  height: 1.5,
                  decoration: TextDecoration.underline
              ),),),
          )
        ],
      ),
      body: SafeArea(child: Column(
        children: [
          // profile image section
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/student_img3.jpg'),
            ),
            title: BigText(text: 'Suman Mondal'),
            subtitle: MediumText(text: 'GrnLYFT Pilot',textAlign: TextAlign.start,),
          ),

          // profile details sections

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [


                _customListTile('assets/images/person_icon.png', 'FULL NAME', 'Suman Mandal'),
                _customListTile('assets/images/email.png', 'EMAIL', 'mondalsuman97322@gmail.com'),
                _customListTile('assets/images/call.png', 'PHONE NUMBER', '+91 98328 00571')

              ],
            ),
          )

        ],
      )),
    );
  }
}


Widget _customListTile(String imagePath, String title, String subTitle){
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Image.asset(imagePath,width: 16,height: 18,fit: BoxFit.contain,),
    ),
    title: BigText(text: title,txtColor: Color(0xff32343E),fontSize: 15.sp,fontWeight: FontWeight.w400,),
    subtitle: MediumText(text: subTitle,textAlign: TextAlign.start,fontSize: 13.sp,),
  );
}