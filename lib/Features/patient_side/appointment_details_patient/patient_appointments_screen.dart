import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/data/models/appiontment_model.dart';
import 'package:health_care_app/data/user_session.dart';
import '../appointment_details_patient/appointment_details_patient_screen.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String patientId = UserSession.currentPatient?.patientId ?? '';

    final CollectionReference appointmentsRef =
    FirebaseFirestore.instance.collection('appointments');

    Stream<List<AppointmentModel>> getAppointments() {
      if (patientId.isEmpty) return const Stream.empty();

      return appointmentsRef
          .where('patientId', isEqualTo: patientId)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
            .map(
              (doc) => AppointmentModel.fromMap(
              doc.data() as Map<String, dynamic>),
        )
            .toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: patientId.isEmpty
          ? const Center(
        child: Text(
          "No patient is logged in.",
          style: TextStyle(color: Colors.grey),
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟦 عنوان الصفحة
          const SizedBox(height: 20),
          Center(
            child: const Text(
              "My Appointments",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<AppointmentModel>>(
              stream: getAppointments(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error loading appointments:\n${snapshot.error}",
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      "You don't have any appointments yet.",
                      style:
                      TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                final appointments = snapshot.data!;
                appointments.sort(
                      (a, b) =>
                      a.appointmentDate.compareTo(b.appointmentDate),
                );

                return ListView.separated(
                  itemCount: appointments.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final appt = appointments[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PatientAppointmentDetailsScreen(
                              appointmentId: appt.appointmentId,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppColors
                                    .backgroundColorBlue
                                    .withOpacity(0.1),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: AppColors
                                      .backgroundColorBlue,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appt.appointmentType,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${appt.appointmentDate.day}/${appt.appointmentDate.month}/${appt.appointmentDate.year}  •  ${appt.appointmentTime}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}