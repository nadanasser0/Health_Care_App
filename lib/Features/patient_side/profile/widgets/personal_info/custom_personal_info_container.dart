import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/personal_info/custom_profile_info_row.dart';

class CustomPersonalInfoContainer extends StatelessWidget {
  const CustomPersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
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
              SizedBox(height: 50),
              Text(
                "Nada Nasser",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 20),
              Text(
                "NadaNasser123@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  wordSpacing: 3,
                ),
              ),
              SizedBox(height: 20),
              CustomProfileInfoRow(
                icon: Icons.person,
                text: 'Nada Nasser',
                onTap: () {},
              ),

              Divider(),
              CustomProfileInfoRow(
                icon: Icons.settings,
                text: 'Nada Nasser@gmail.com',
                onTap: () {},
              ),

              Divider(),
              CustomProfileInfoRow(
                icon: Icons.help,
                text: 'Male',
                onTap: () {},
              ),
              Divider(),
              CustomProfileInfoRow(
                icon: Icons.logout,
                text: '19/12/2001',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
