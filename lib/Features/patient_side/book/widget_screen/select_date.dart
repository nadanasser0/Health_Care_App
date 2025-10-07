import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:health_care_app/core/constants/colors.dart';

// import '../../../core/constants/colors.dart';
class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Date", style: TextStyle(fontSize: 18)),
            Text(
              "Set Manual",
              style: TextStyle(fontSize: 15, color: AppColors.blueColor),
            ),
          ],
        ),
        const SizedBox(height: 16),
        EasyDateTimeLine(
          initialDate: selectedDate,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          activeColor: AppColors.blueColor,
          dayProps: const EasyDayProps(width: 60, height: 80),
          timeLineProps: const EasyTimeLineProps(separatorPadding: 8),
        ),
      ],
    );
  }
}
