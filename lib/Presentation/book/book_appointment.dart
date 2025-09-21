import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/book/widget_screen/appointment_type.dart';
import 'package:health_care_app/Presentation/book/widget_screen/available_time.dart';
import 'package:health_care_app/Presentation/book/widget_screen/gender.dart';
import 'package:health_care_app/Presentation/book/widget_screen/patient_information.dart';
import 'package:health_care_app/Presentation/book/widget_screen/select_date.dart';
import 'package:health_care_app/Presentation/book/widget_screen/text_field_view.dart';

import '../../shared/custom_button.dart';
import '../appointment/your_appointment.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Book Appointment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectDate(),
              const SizedBox(height: 20),
              AvailableTime(),
              const SizedBox(height: 20),
              AppointmentType(),
              const SizedBox(height: 10),
              Divider(color: Color(0xff6D7CCD)),
              const SizedBox(height: 5),
              PatientInformation(),
              SizedBox(height: 10),
              TextFieldView(),
              SizedBox(height: 7),
              Gender(),
              SizedBox(height: 7),
              CustomButton(name: 'Continue', page: YourAppointment())
            ],
          ),
        ),
      ),
    );
  }
}


