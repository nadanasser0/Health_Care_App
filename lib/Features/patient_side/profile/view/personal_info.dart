import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/personal_info_widgets/photos_show_sheet.dart';
import 'package:health_care_app/Features/patient_side/profile/view/profile_view.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/custom_appbar.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/personal_info/custom_personal_info_container.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/user_image_profile.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/shared/user_session.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Personal Information',
        textColor: Colors.white,
        onBack: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePatientScreen()),
          );
        },
      ),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,

            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 5, 132, 236),
            ),
            child: Column(
              children: [SizedBox(height: 200), CustomPersonalInfoContainer()],
            ),
          ),
          Positioned(
            // right: 150,
            top: 120,
            left: (MediaQuery.of(context).size.width / 2) - 70,
            child: UserImageProfile(),
          ),
          Positioned(
            // right: 130,
            right: 175,
            // top: 220,
            top: 225,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: AppColors.blackColor.withOpacity(0.8),
              child: IconButton(
                icon: Icon(
                  Icons.mode_edit_outline_outlined,
                  color: AppColors.whiteColor,
                  size: 13,
                ),
                onPressed: () async {
                  final userId = FirebaseAuth.instance.currentUser!.uid;
                  final newImageUrl = await showImagePickerSheet(
                    context,
                    userId,
                  );
                  if (newImageUrl != null) {
                    setState(() {
                      UserSession.currentUser = UserSession.currentUser!
                          .copyWith(image: newImageUrl);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
