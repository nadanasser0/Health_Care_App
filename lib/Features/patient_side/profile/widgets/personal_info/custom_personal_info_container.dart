import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/personal_info/custom_profile_info_row.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/services/firestore_services.dart';
import 'package:health_care_app/shared/user_session.dart';

class CustomPersonalInfoContainer extends StatefulWidget {
  const CustomPersonalInfoContainer({super.key});

  @override
  State<CustomPersonalInfoContainer> createState() =>
      _CustomPersonalInfoContainerState();
}

class _CustomPersonalInfoContainerState
    extends State<CustomPersonalInfoContainer> {
  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService = FirestoreService();

    return  Expanded(
  child: Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),

          Text(
            UserSession.currentUser!.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            UserSession.currentUser!.email,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.greyColor,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomProfileInfoRow(
                    label: "Name",
                    text: UserSession.currentUser!.name,
                    onSave: (newValue) {
                      UserSession.currentUser =
                          UserSession.currentUser?.copyWith(name: newValue);

                      setState(() {});
                      firestoreService.updateUserField("name", newValue);
                    },
                  ),

                  CustomProfileInfoRow(
                    label: "Email",
                    text: UserSession.currentUser!.email,
                    onSave: (newValue) {
                      UserSession.currentUser =
                          UserSession.currentUser?.copyWith(email: newValue);

                      setState(() {});
                      firestoreService.updateUserField("email", newValue);
                    },
                  ),

                  CustomProfileInfoRow(
                    label: "Phone Number",
                    text: UserSession.currentUser!.phoneNum.toString(),
                    onSave: (newValue) {
                      int intNewValue = int.parse(newValue);
                      UserSession.currentUser =
                          UserSession.currentUser?.copyWith(
                        phoneNum: intNewValue,
                      );
                      setState(() {});
                      firestoreService.updateUserField(
                          "phoneNum", intNewValue);
                    },
                  ),

                  CustomProfileInfoRow(
                    label: "Gender",
                    text: UserSession.currentUser!.gender ?? 'Gender not set',
                    onSave: (newValue) {
                      UserSession.currentUser =
                          UserSession.currentUser?.copyWith(
                        gender: newValue,
                      );
                      setState(() {});
                    },
                  ),

                  CustomProfileInfoRow(
                    label: "Age",
                    text: UserSession.currentUser!.age.toString(),
                    onSave: (newValue) {
                      int value = int.parse(newValue);
                      UserSession.currentUser =
                          UserSession.currentUser?.copyWith(age: value);

                      setState(() {});
                      firestoreService.updateUserField("age", value);
                    },
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
  }