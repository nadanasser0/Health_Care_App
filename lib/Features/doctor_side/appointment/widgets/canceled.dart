import 'package:flutter/material.dart';
import 'custom_card_appoinment.dart';

class Canceled extends StatelessWidget {
  const Canceled({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemBuilder: (context, index) => CustomCardAppointment(
        appointmentStatue: "Appointment Canceled",
        day: "Monday, 25 June",
        time: "11:00 AM",
        color: Color(0xff9B0A0A),
        name: "Mazen Elsayed",
        status: "General checkup",
        imgPath: "assets/img.png",
      ),
    );
  }
}
