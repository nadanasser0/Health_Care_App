import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/view/personal_info.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_avatar.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_navbar.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_row.dart';
import 'package:health_care_app/Features/patient_side/profile/view/settings_page.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/user_profile/logout_dialog.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomDoctorNavbar(),

      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [CustomDoctorAvatar(docName: 'Nada Nasser')],
              ),
            ),

            SizedBox(height: 50),

            CustomDoctorRow(
              onpress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorPersonalInfo(),
                  ),
                );
              },
              icon: Icons.person_2_outlined,
              text: 'personal info',
            ),
            SizedBox(height: 30),
            //  Divider(),
            CustomDoctorRow(
              onpress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              icon: Icons.settings,
              text: 'settings',
            ),
            SizedBox(height: 30),
            //  Divider(),
            CustomDoctorRow(
              onpress: () {},
              icon: Icons.help_outline_rounded,
              text: 'help',
            ),
            SizedBox(height: 30),
            //  Divider(),
            CustomDoctorRow(
              onpress: () {
                LogoutDialog.show(
                  context,
                  onLogout: () {
                    print('User logged out');
                  },
                );
              },
              icon: Icons.login_outlined,
              text: 'logout',
            ),
            SizedBox(height: 30),
            //  Divider(),
            //  CustomDoctorRow(onpress: () { }, icon: Icons.settings, text: 'personal info',),
          ],
        ),
      ),
    );
  }
}
