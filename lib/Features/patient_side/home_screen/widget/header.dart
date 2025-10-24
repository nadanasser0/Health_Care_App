import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/notification/notification_screen.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

///          header widget
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Mazen!", style: AppFonts.bodyLarge),
            SizedBox(height: 5),
            Text(
              "How Are you Today?",
              style: TextStyle(color: AppColors.textColorGrey),
            ),
          ],
        ),
        Spacer(),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            
            border: BoxBorder.all(color: AppColors.blueColor),
            shape: BoxShape.circle,
            
            // color: AppColors.textColorBlue.withOpacity(0.1),
            color: AppColors.whiteColor,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            icon: Icon(Icons.notification_add_outlined , color: AppColors.blueColor,),
          ),
        ),
      ],
    );
  }
}
