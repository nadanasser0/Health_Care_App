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

    return Expanded(
      child: Container(
        height: 300,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 65),
              Text(
                UserSession.currentUser!.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 5),
              Text(
                UserSession.currentUser!.email,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyColor,
                ),
              ),

              const SizedBox(height: 20),

              CustomProfileInfoRow(
                text: UserSession.currentUser!.name,
                onSave: (newValue) {
                  UserSession.currentUser = UserSession.currentUser?.copyWith(
                    name: newValue,
                  );
                  setState(() {});
                  firestoreService.updateUserField("name", newValue);
                },
              ),

              const Divider(),

              CustomProfileInfoRow(
                text: UserSession.currentUser!.email,
                onSave: (newValue) {
                  UserSession.currentUser = UserSession.currentUser?.copyWith(
                    email: newValue,
                  );
                  setState(() {});
                  firestoreService.updateUserField("email", newValue);

                },
              ),

              const Divider(),

              CustomProfileInfoRow(
                text: UserSession.currentUser!.gender ?? 'Gender not set',
                onSave: (newValue) {
                  UserSession.currentUser = UserSession.currentUser?.copyWith(
                    gender: newValue,
                  );
                  setState(() {});
                },
              ),
            const Divider(),
              CustomProfileInfoRow(
                text: UserSession.currentUser!.age.toString() ,
                onSave: (newValue) {
                  UserSession.currentUser = UserSession.currentUser?.copyWith(
                    age:int.parse( newValue),
                  );
                  setState(() {});
                  firestoreService.updateUserField("age", int.parse(newValue));
                },
              ),

              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
