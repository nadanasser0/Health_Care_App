import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/notification/notification_screen.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/core/routes/app_routes.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Mazen!", style: AppFonts.titleBold),
            SizedBox(height: 5),
            Text(
              "How Are you Today?",
              style: TextStyle(color: AppColors.greyColor),
            ),
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyLightColor,
          ),
          child: IconButton(
            onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );

              // Navigator.pushReplacementNamed(context, AppRoutes.notification);
            },
            icon: Icon(Icons.notification_add_outlined),
          ),
        ),
      ],
    );
  }
}
