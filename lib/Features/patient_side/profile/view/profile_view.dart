import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/home/home.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/custom_appbar.dart';
// import 'package:health_care_app/Features/patient_side/profile/widgets/customRow.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/user_profile/custom_profile_container.dart';
// import 'package:health_care_app/Features/patient_side/profile/widgets/shared/profile_header.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/user_image_profile.dart';

class ProfilePatientScreen extends StatelessWidget {
  const ProfilePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'My Profile', textColor: Colors.white ,onBack:(){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>HomeScreen()));
      } ,),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Colors.blue.shade300, Colors.white],
              // ),
              color: const Color.fromARGB(255, 5, 132, 236),
            ),
            child: Column(
              children: [
                // ProfileHeader(),
                SizedBox(height: 200),
                CustomContainer(),
              ],
            ),
          ),
          Positioned(
            // top: MediaQuery.of(context).size.height -595 ,
            // left: MediaQuery.of(context).size.width / 2 - 50,
            top: 130,
            left: (MediaQuery.of(context).size.width / 2) - 55,
            child: UserImageProfile(),
          ),
        ],
      ),
    );
  }
}
