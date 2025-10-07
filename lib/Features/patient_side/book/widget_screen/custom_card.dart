import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

// import '../../../core/constants/colors.dart';
class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.date});

  final String date;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ?   AppColors.blueColor :   AppColors.whiteColor,
        ),
        child: Center(
          child: Text(
            widget.date,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}