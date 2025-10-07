import 'package:flutter/material.dart';

import 'custom_card.dart';

class AvailableTime extends StatelessWidget {
  const AvailableTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available time",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 7),
        Row(
          children: [
            Expanded(child: CustomCard(date: "08:00 AM")),
            SizedBox(width: 7),
            Expanded(child: CustomCard(date: "08:30 AM")),
          ],
        ),
        SizedBox(height: 7),
        Row(
          children: [
            Expanded(child: CustomCard(date: "09:00 AM")),
            SizedBox(width: 7),
            Expanded(child: CustomCard(date: "09:30 AM")),
          ],
        ),
        SizedBox(height: 7),
        Row(
          children: [
            Expanded(child: CustomCard(date: "10:00 AM")),
            SizedBox(width: 7),
            Expanded(child: CustomCard(date: "10:30 AM")),
          ],
        ),
      ],
    );
  }
}
