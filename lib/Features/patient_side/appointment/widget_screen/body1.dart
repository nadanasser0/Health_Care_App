import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  bool isSelectedTime = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelectedTime = true;
            });
          },
          child: Container(
            height: 37,
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.redColor),
              color: isSelectedTime
                  ?  AppColors.redColor
                  : AppColors.whiteColor,
            ),
            child: Center(
              child: Text(
                "08/09/2025",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isSelectedTime ? AppColors.whiteColor: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              isSelectedTime = false;
            });
          },
          child: Container(
            height: 37,
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.redColor),
              color: isSelectedTime == false
                  ? AppColors.redColor
                  : AppColors.whiteColor
            ),
            child: Center(
              child: Text(
                "Wed 08:30 AM",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isSelectedTime == false
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
