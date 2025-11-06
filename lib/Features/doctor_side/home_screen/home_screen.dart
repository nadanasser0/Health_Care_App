import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/Features/doctor_side/appointment/doctor_appoinment.dart';
import 'package:health_care_app/Features/doctor_side/home_screen/widgets/patient_card.dart';
import 'package:health_care_app/core/constants/colors.dart';
import '../../../models/appiontment_model.dart';

class HomeScreenD extends StatelessWidget {
  const HomeScreenD({super.key});

  final String doctorId = '67890'; // ID الخاص بالدكتور

  @override
  Widget build(BuildContext context) {
    final CollectionReference appointmentsRef =
    FirebaseFirestore.instance.collection('appointments');

    Stream<List<AppointmentModel>> getAllAppointments() {
      return appointmentsRef.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
      });
    }

    // دالة لإلغاء الموعد
    void cancelAppointment(AppointmentModel appointment, BuildContext context) async {
      final docRef = appointmentsRef.doc(appointment.appointmentId);
      await docRef.update({'status': 'canceled'});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Appointment canceled")),
      );
    }

    // دالة لتعيين الموعد كمكتمل
    void completeAppointment(AppointmentModel appointment, BuildContext context) async {
      final docRef = appointmentsRef.doc(appointment.appointmentId);
      await docRef.update({'status': 'done'});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Appointment marked as done")),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text(
                "Hi, Doctor Omar!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "How are you today?",
                style: TextStyle(color: AppColors.greyColor),
              ),
              const SizedBox(height: 20),

              // ======= الكارد الخاصة بأقرب موعد =======
              StreamBuilder<List<AppointmentModel>>(
                stream: getAllAppointments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: Text("No upcoming appointments")),
                    );
                  }

                  final upcomingAppointments = snapshot.data!
                      .where((app) =>
                  app.doctorId == doctorId &&
                      app.status == 'upcoming')
                      .toList();

                  if (upcomingAppointments.isEmpty) {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: Text("No upcoming appointments")),
                    );
                  }

                  final appointment = upcomingAppointments.first;

                  return Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.cyanColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                    AssetImage('lib/images/img.png'),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    appointment.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    appointment.appointmentType,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    "lib/images/message-text.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.darkBlueColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.whiteColor,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year} | ${appointment.appointmentTime}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              // ======= قائمة المواعيد القادمة =======
              Row(
                children: [
                  const Text(
                    "Upcoming Appointments",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorAppointment()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ======= قائمة المواعيد القادمة =======
              StreamBuilder<List<AppointmentModel>>(
                stream: getAllAppointments(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        "No upcoming appointments yet.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  final doctorAppointments = snapshot.data!
                      .where((app) =>
                  app.doctorId == doctorId &&
                      app.status == 'upcoming')
                      .toList();

                  if (doctorAppointments.isEmpty) {
                    return const Center(
                      child: Text(
                        "No upcoming appointments yet.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  // ✅ هنا بنشيك لو المعاد عدى وقته نحوله تلقائيًا لـ canceled
                  for (var appointment in doctorAppointments) {
                    try {
                      // بنبني تاريخ ووقت الموعد
                      final date = appointment.appointmentDate;
                      final timeParts = appointment.appointmentTime.split(' ');
                      final hourMinute = timeParts[0].split(':');
                      int hour = int.parse(hourMinute[0]);
                      int minute = int.parse(hourMinute[1]);
                      if (timeParts.length > 1 &&
                          timeParts[1].toUpperCase() == 'PM' &&
                          hour != 12) {
                        hour += 12;
                      }

                      final appointmentDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        hour,
                        minute,
                      );

                      // لو الوقت الحالي بعد وقت الموعد نحوله تلقائيًا
                      if (appointmentDateTime.isBefore(DateTime.now())) {
                        final docRef = appointmentsRef.doc(appointment.appointmentId);
                        docRef.update({'status': 'canceled'});
                      }
                    } catch (e) {
                      debugPrint('Error parsing appointment time: $e');
                    }
                  }

                  // ======= عرض الكروت =======
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctorAppointments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 7),
                    itemBuilder: (context, index) {
                      final appointment = doctorAppointments[index];
                      return Card(
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
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          appointment.appointmentType,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year} | ${appointment.appointmentTime}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
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
                                padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                                child: Row(
                                  children: [
                                    // زر Cancel
                                    OutlinedButton(
                                      onPressed: () {
                                        cancelAppointment(appointment, context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(120, 35),
                                        side: BorderSide(color: AppColors.blueColor),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: AppColors.blackColor),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // زر Done
                                    ElevatedButton(
                                      onPressed: () {
                                        completeAppointment(appointment, context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.blueColor,
                                        minimumSize: const Size(120, 35),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),


              const SizedBox(height: 25),
              //
              // // ======= المرضى الأخيرين =======
              // Row(
              //   children: [
              //     const Text(
              //       "Recent Patients",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //     ),
              //     const Spacer(),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => DoctorAppointment()),
              //         );
              //       },
              //       child: Text(
              //         "See All",
              //         style: TextStyle(color: AppColors.blueColor),
              //       ),
              //     ),
              //   ],
              // ),
              //
              // StreamBuilder<List<AppointmentModel>>(
              //   stream: getAllAppointments(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //       return const Center(child: Text("No patients yet"));
              //     }
              //
              //     final appointments = snapshot.data!
              //         .where((app) => app.doctorId == doctorId)
              //         .toList();
              //
              //     return ListView.separated(
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemCount: appointments.length,
              //       separatorBuilder: (_, __) => const SizedBox(height: 7),
              //       itemBuilder: (context, index) {
              //         final appointment = appointments[index];
              //         return PatientCard(
              //           name: appointment.name,
              //           status: appointment.appointmentType,
              //           imgPath: 'lib/images/img.png',
              //         );
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
