import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/confirmation/widgets/booking_details.dart';
import 'package:health_care_app/Presentation/confirmation/widgets/header_booking_confirmation.dart';
import 'package:health_care_app/Presentation/confirmation/widgets/instructions.dart';
import 'package:health_care_app/Presentation/confirmation/widgets/payment_details_widget.dart';
import '../../shared/custom_button.dart';
import '../appointment/your_appointment.dart';

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({super.key});

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
        title: Text(
          "Booking Confirmation",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xff247CFF),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 10,
            children: [
              HeaderBookingConfirmation(),
              BookingDetails(),
              PaymentDetailsConfirmation(),
              Instructions(),
              SizedBox(height: 20,),
              CustomButton(name: 'Back to Home', page: YourAppointment()),
            ],
          ),
        ),
      ),
    );
  }
}
