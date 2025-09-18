import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/appointment/widget_screen/body1.dart';
import 'package:health_care_app/Presentation/appointment/widget_screen/details_patient.dart';
import 'package:health_care_app/Presentation/appointment/widget_screen/header.dart';
import 'package:health_care_app/Presentation/appointment/widget_screen/payment_option.dart';
import 'package:health_care_app/Presentation/appointment/widget_screen/price_view.dart';
import 'package:health_care_app/Presentation/payment/payment_details.dart';
import '../../core/constants/colors.dart';
import '../../shared/custom_button.dart';

class YourAppointment extends StatefulWidget {
  const YourAppointment({super.key});

  @override
  State<YourAppointment> createState() => _YourAppointmentState();
}

class _YourAppointmentState extends State<YourAppointment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Your appointment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 12,
            children: [
              Header(),
              Divider(color: AppColors.purpleColor,),
              Body1(),
              Divider(color: AppColors.purpleColor,),
              DetailsPatient(),
              Divider(color: AppColors.purpleColor,),
              PriceView(),
              Divider(color: AppColors.purpleColor,),
              PaymentOption(),
              SizedBox(height: 10,),
              CustomButton(name: 'Confirm', page: PaymentDetails())
            ],
          ),
        ),
      ),
    );
  }
}
