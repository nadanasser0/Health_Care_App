import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/custom_appbar.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/personal_info/custom_personal_info_container.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/user_image_profile.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Personal Information', textColor: Colors.white,),
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
                // ProfileHeader(title: "Personal Informatio",),
                SizedBox(height: 200),
                CustomPersonalInfoContainer(),
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
