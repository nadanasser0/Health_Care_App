import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/core/constants/colors.dart';
import '../../../../models/appiontment_model.dart';

class Upcoming extends StatelessWidget {
  final String patientId = '12345'; // استخدمي الـ ID الخاص بالمريض
  Upcoming({super.key});

  final CollectionReference appointmentsRef =
  FirebaseFirestore.instance.collection('appointments');

  Stream<List<AppointmentModel>> getPatientAppointments() {
    return appointmentsRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  void cancelAppointment(AppointmentModel appointment, BuildContext context) async {
    final docRef = appointmentsRef.doc(appointment.appointmentId);
    await docRef.update({'status': 'canceled'});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Appointment canceled")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppointmentModel>>(
      stream: getPatientAppointments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text(
                "No upcoming appointments yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ));
        }

        // جلب المواعيد القادمة فقط
        final patientAppointments = snapshot.data!
            .where((app) => app.patientId == patientId && app.status == 'upcoming')
            .toList();

        if (patientAppointments.isEmpty) {
          return const Center(
              child: Text(
                "No upcoming appointments yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recent Appointments",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: patientAppointments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 7),
                  itemBuilder: (context, index) {
                    final appointment = patientAppointments[index];
                    return Card(
                      margin: EdgeInsets.zero,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: AppColors.greyColor.withOpacity(0.8),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('lib/images/img.png'),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        appointment.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        appointment.appointmentType,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        "${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year} | ${appointment.appointmentTime}",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'lib/images/message-text.png',
                                    width: 28,
                                    height: 28,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: OutlinedButton(
                                  onPressed: () {
                                    cancelAppointment(appointment, context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(150, 35),
                                    side: BorderSide(color: AppColors.blueColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: Text(
                                    "Cancel Appointment",
                                    style: TextStyle(color: AppColors.blackColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
