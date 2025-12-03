import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/custom_appbar.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/user_profile/custom_profile_container.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/user_image_profile.dart';
import 'package:health_care_app/shared/widgets/navigator.dart';

class ProfilePatientScreen extends StatefulWidget {
  const ProfilePatientScreen({super.key});

  @override
  State<ProfilePatientScreen> createState() => _ProfilePatientScreenState();
}

class _ProfilePatientScreenState extends State<ProfilePatientScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'My Profile',
        textColor: Colors.white,
        onBack: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationnScreen()),
          );
        },
      ),
      extendBodyBehindAppBar: true,
      body: Expanded(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 132, 236),
              ),
              child: Column(children: [SizedBox(height: 200), CustomContainer()]),
            ),
            Positioned(
              top: 125,
              // top: 120,
              left: (MediaQuery.of(context).size.width / 2) - 60,
              child: UserImageProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
