import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/book/book_appointment.dart';
import 'package:health_care_app/core/constants/colors.dart';

class MakeAppointmentButton extends StatelessWidget {
  const MakeAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), 
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
         MaterialPageRoute(builder: (context)=>BookAppointment())  );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor, 
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Make An Appointment',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}