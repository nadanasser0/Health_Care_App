import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 13),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Reminder",
            style: AppFonts.titleBold.copyWith(color: AppColors.orangeeColor),
          ),
          SizedBox(height: 7),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "You Have An Appointment With\nDr. Mohamed Eleraky",
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.blackColor,
                      height: 1.8,
                    ),
                  ),
                  TextSpan(
                    text: "\t\t\t\t\tAt 2:00 PM",
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.orangeeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reschedule button
              SizedBox(
                width: 140,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    print("Reschedule");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: AppColors.whiteColor,
                    side: BorderSide(color: AppColors.orangeeColor, width: 2),
                  ),
                  child: Text(
                    "Reschedule",
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.orangeeColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              // Details button
              SizedBox(
                width: 140,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    print("Details");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: AppColors.orangeeColor,
                    side: BorderSide(color: AppColors.whiteColor, width: 2),
                  ),
                  child: Text(
                    "Details",
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
