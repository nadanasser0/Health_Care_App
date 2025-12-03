import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/confirmation/widgets/header_booking_confirmation.dart';
import 'package:health_care_app/Features/patient_side/confirmation/widgets/instructions.dart';
import 'package:health_care_app/shared/widgets/custom_button.dart';
import 'package:health_care_app/shared/widgets/navigator.dart';
import '../../../core/constants/colors.dart';
import '../appointment/upload_receipt_sheet.dart';

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({
    super.key,
    required this.appointmentId,
    required this.bookingFor,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.paymentMethod,
    required this.prise,
  });

  final String appointmentId;
  final String bookingFor;
  final String fullName;
  final String age;
  final String gender;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String paymentMethod;
  final int prise;

  @override
  Widget build(BuildContext context) {
    final bool isFawry = paymentMethod.toLowerCase().contains('fawry');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Booking Confirmation",
          style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xff247CFF)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(appointmentId)
            .snapshots(),
        builder: (context, snap) {
          final data = (snap.data?.data() as Map<String, dynamic>?) ?? {};
          final receiptLocalPath = data['receiptLocalPath']?.toString();
          final receiptNote = data['receiptNote']?.toString();
          final paymentStatus = (data['paymentStatus'] ?? 'pending').toString();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const HeaderBookingConfirmation(),
                  const SizedBox(height: 12),

                  // Booking Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Booking Details:",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Full Name:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                              Text("Age:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                              Text("Gender:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                              Text("Date:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                              Text("Time:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                              Text("Session Status:", style: TextStyle(fontSize: 16, color: AppColors.purpleColor)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fullName, style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
                              Text(age, style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
                              Text(gender, style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
                              Text(
                                "${appointmentDate.day.toString().padLeft(2, '0')}/${appointmentDate.month.toString().padLeft(2, '0')}/${appointmentDate.year}",
                                style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                              ),
                              Text(appointmentTime, style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
                              Text("Upcoming", style: TextStyle(fontSize: 16, color: AppColors.greyColor)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Color(0xff6D7CCD)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Payment Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Payment Details:",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Payment Method:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.purpleColor)),
                              Text("Amount Paid:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.purpleColor)),
                              if (isFawry)
                                Text("Payment Status:",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.purpleColor)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(paymentMethod,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.greyColor)),
                              Text("$prise EGP",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.greyColor)),
                              if (isFawry)
                                Text(paymentStatus,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.greyColor)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(color: AppColors.purpleColor),
                    ],
                  ),

                  // ✅ Receipt section (هنا)
                  if (isFawry) ...[
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xff247CFF).withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xff247CFF).withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Fawry Receipt",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),

                          if (receiptLocalPath != null &&
                              receiptLocalPath.isNotEmpty &&
                              File(receiptLocalPath).existsSync())
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.file(
                                File(receiptLocalPath),
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                          else
                            Container(
                              height: 140,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F7FB),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Text(
                                "No receipt attached yet",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),

                          if (receiptNote != null && receiptNote.trim().isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Text("Note: $receiptNote", style: const TextStyle(color: Colors.black54)),
                          ],

                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff247CFF),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                minimumSize: const Size(double.infinity, 48),
                              ),
                              icon: const Icon(Icons.upload_file, color: Colors.white),
                              label: Text(
                                (receiptLocalPath == null || receiptLocalPath.isEmpty)
                                    ? "Upload / Take Photo"
                                    : "Retake / Change",
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  builder: (_) => UploadReceiptSheet(appointmentId: appointmentId),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 14),
                  const Instructions(),
                  const SizedBox(height: 20),

                  CustomButton(
                    name: 'Back to Home',
                    page: NavigationnScreen(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
