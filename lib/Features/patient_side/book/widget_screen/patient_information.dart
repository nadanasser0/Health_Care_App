import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

// import '../../../core/constants/colors.dart';

class PatientInformation extends StatefulWidget {
  const PatientInformation({super.key});

  @override
  State<PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  bool isSelectedYou = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Patient Information",
          style: TextStyle(fontSize: 20, color: AppColors.blueColor),
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isSelectedYou = true;
                });
              },
              child: Container(
                height: 39,
                width: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.redColor),
                  color: isSelectedYou
                      ? AppColors.redColor
                      : AppColors.whiteColor,
                ),
                child: Center(
                  child: Text(
                    "you",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelectedYou ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            InkWell(
              onTap: () {
                setState(() {
                  isSelectedYou = false;
                });
              },
              child: Container(
                height: 39,
                width: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffFF6B66)),
                  color: isSelectedYou == false
                      ? const Color(0xffFF6B66)
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    "Someone Else",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelectedYou == false
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
