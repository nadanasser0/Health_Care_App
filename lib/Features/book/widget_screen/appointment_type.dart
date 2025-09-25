import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class AppointmentType extends StatefulWidget {
  const AppointmentType({super.key});

  @override
  State<AppointmentType> createState() => _AppointmentTypeState();
}

class _AppointmentTypeState extends State<AppointmentType> {
  String? appointmentType;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Appointment Type",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Icon(Icons.person, color: AppColors.blueColor),
            const SizedBox(width: 5),
            const Text("In Person",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
            const Spacer(),
            Radio<String>(
              value: "in_person",
              activeColor:  AppColors.blueColor,
              groupValue: appointmentType,
              onChanged: (value) {
                setState(() {
                  appointmentType = value;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.red),
            const SizedBox(width: 5),
            const Text("Chat",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
            const Spacer(),
            Radio<String>(
              value: "chat",
              activeColor:  AppColors.blueColor,
              groupValue: appointmentType,
              onChanged: (value) {
                setState(() {
                  appointmentType = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
