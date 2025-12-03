import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/data/models/appiontment_model.dart';

class PatientAppointmentDetailsScreen extends StatelessWidget {
  final String appointmentId;

  const PatientAppointmentDetailsScreen({
    super.key,
    required this.appointmentId,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xff247CFF);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        title: const Text(
          "Your Appointment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(appointmentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error:\n${snapshot.error}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text(
                "Appointment not found.",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          final data = snapshot.data!.data()!;
          final appt = AppointmentModel.fromMap(data);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Header Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withOpacity(0.95),
                        const Color(0xff1A4FA0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.medical_services_outlined,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appt.appointmentType,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 16, color: Colors.white),
                                const SizedBox(width: 6),
                                Text(
                                  "${appt.appointmentDate.day.toString().padLeft(2, '0')}/"
                                      "${appt.appointmentDate.month.toString().padLeft(2, '0')}/"
                                      "${appt.appointmentDate.year}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.access_time,
                                    size: 16, color: Colors.white),
                                const SizedBox(width: 6),
                                Text(
                                  appt.appointmentTime,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                /// 🔹 Status Chip
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appt.status == "upcoming"
                          ? Colors.orange.withOpacity(0.1)
                          : appt.status == "done"
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          appt.status == "upcoming"
                              ? Icons.schedule
                              : appt.status == "done"
                              ? Icons.check_circle
                              : Icons.cancel,
                          size: 16,
                          color: appt.status == "upcoming"
                              ? Colors.orange
                              : appt.status == "done"
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          appt.status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: appt.status == "upcoming"
                                ? Colors.orange
                                : appt.status == "done"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 Appointment Info Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Appointment Info",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _tile(Icons.local_hospital_outlined, "Type",
                            appt.appointmentType),
                        const Divider(),
                        _tile(
                          Icons.calendar_month,
                          "Date",
                          "${appt.appointmentDate.day.toString().padLeft(2, '0')}/"
                              "${appt.appointmentDate.month.toString().padLeft(2, '0')}/"
                              "${appt.appointmentDate.year}",
                        ),
                        const Divider(),
                        _tile(Icons.access_time, "Time", appt.appointmentTime),
                        const Divider(),
                        _tile(Icons.attach_money, "Price",
                            "${appt.price.toStringAsFixed(0)} EGP"),
                        const Divider(),
                        _tile(Icons.payment, "Payment Method", appt.billingMethod),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                /// 🔹 Prescription
                Row(
                  children: const [
                    Icon(Icons.description_outlined, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      "Prescription",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                if (appt.prescription != null && appt.prescription!.trim().isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      appt.prescription!,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "No prescription has been added yet.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _tile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}