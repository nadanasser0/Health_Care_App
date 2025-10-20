import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/profile/view/FAQ_page.dart';
import 'package:health_care_app/Features/patient_side/profile/view/notifacation_page.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/shared/custom_appbar.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/settings/custom_settings_darkmode_row.dart';
import 'package:health_care_app/Features/patient_side/profile/widgets/settings/custom_settings_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Settings', textColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: Column(
          children: [
            CustomSettingsRow(
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifacationPage(),
                  ),
                );
              },
            ),
            const Divider(),
            const SizedBox(height: 15),
            CustomSettingsRow(
              icon: Icons.help_outline,
              title: 'FAQ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              },
            ),
            const Divider(),
            const SizedBox(height: 15),
            CustomSettingsRow(
              icon: Icons.language_sharp,
              title: 'Language',
              onTap: () {},
            ),
            const Divider(),

            DarkModeSwitch(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
