import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/appointment/widget_screen/body1.dart';
import 'package:health_care_app/Features/patient_side/appointment/widget_screen/details_patient.dart';
import 'package:health_care_app/Features/patient_side/appointment/widget_screen/payment_option.dart';
import 'package:health_care_app/Features/patient_side/appointment/widget_screen/price_view.dart';
import 'package:health_care_app/Features/patient_side/confirmation/booking_confirmation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/colors.dart';
import '../../../models/appiontment_model.dart';
import '../../../services/firestore_services.dart';

class YourAppointment extends StatefulWidget {
  const YourAppointment({
    super.key,
    required this.bookingFor,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.appointmentDate,
    required this.appointmentTime, required this.doctorName, required this.specialty, required this.hospitalName, required this.rating, required this.doctorImageUrl, required this.numberOfReviews, required this.workingDays, required this.workingHours, required this.price,
  });

  final String bookingFor;
  final String fullName;
  final String age;
  final String gender;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String doctorName;
  final String specialty;
  final String hospitalName;
  final double rating;
  final String doctorImageUrl;
  final int numberOfReviews;
  final String workingDays;
  final String workingHours;
  final double price;

  @override
  State<YourAppointment> createState() => _YourAppointmentState();
}

class _YourAppointmentState extends State<YourAppointment> {
  final FirestoreService firestoreService = FirestoreService();

  String? paymentMethod; // 🟢 لتخزين طريقة الدفع
  double prise = 250.0;  // 🟢 السعر الثابت أو يمكن ربطه بـ PriceView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Your appointment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🧑‍⚕️ صورة أو أيقونة الطبيب
                  Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.blueColor,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // 🧾 بيانات الطبيب
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          widget.doctorName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                         Text(
                          "${widget.specialty} | ${widget.hospitalName}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff616161),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // 🔘 الزر والتقييم
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              "${widget.rating} (${widget.numberOfReviews} reviews)",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.purpleColor),
              const SizedBox(height: 12),
              Body1(
                appointmentDate: widget.appointmentDate,
                appointmentTime: widget.appointmentTime,
              ),
              Divider(color: AppColors.purpleColor),
              const SizedBox(height: 12),
              DetailsPatient(
                bookingFor: widget.bookingFor,
                fullName: widget.fullName,
                age: widget.age,
                gender: widget.gender,
              ),
              Divider(color: AppColors.purpleColor),
              const SizedBox(height: 12),
              const PriceView(),
              Divider(color: AppColors.purpleColor),
              const SizedBox(height: 12),

              PaymentOption(
                onPaymentSelected: (String method) {
                  setState(() {
                    paymentMethod = method;
                  });
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff247CFF),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (paymentMethod == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a payment method"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  try {
                    final appointmentId = Uuid().v4();

                    final appointment = AppointmentModel(
                      appointmentId: appointmentId,
                      patientId: "12345",
                      doctorId: "67890", // ID الدكتور
                      appointmentDate: widget.appointmentDate,
                      appointmentTime: widget.appointmentTime,
                      appointmentType: "General Checkup",
                      gender: widget.gender,
                      name: widget.fullName,
                      age: int.tryParse(widget.age) ?? 0,
                      price: prise,
                      billingMethod: paymentMethod!,
                    );

                    // 🟢 حفظ الموعد في Firestore
                    await firestoreService.addAppointment(appointment);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Appointment booked successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // الانتقال لصفحة التأكيد
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingConfirmation(
                          bookingFor: widget.bookingFor,
                          fullName: widget.fullName,
                          age: widget.age,
                          gender: widget.gender,
                          appointmentDate: widget.appointmentDate,
                          appointmentTime: widget.appointmentTime,
                          paymentMethod: paymentMethod!,
                          prise: prise.toInt(),
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error saving appointment: $e"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
