import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/models/appiontment_model.dart';
import 'package:health_care_app/shared/user_session.dart';

class DoctorAppointmentDetailsScreen extends StatefulWidget {
  final String appointmentId;

  const DoctorAppointmentDetailsScreen({
    super.key,
    required this.appointmentId,
  });

  @override
  State<DoctorAppointmentDetailsScreen> createState() =>
      _DoctorAppointmentDetailsScreenState();
}

class _DoctorAppointmentDetailsScreenState
    extends State<DoctorAppointmentDetailsScreen> {
  final CollectionReference appointmentsRef =
  FirebaseFirestore.instance.collection('appointments');

  final CollectionReference notificationsRef =
  FirebaseFirestore.instance.collection('notifications');

  final TextEditingController _prescriptionController = TextEditingController();
  bool _isSavingPrescription = false;

  @override
  void dispose() {
    _prescriptionController.dispose();
    super.dispose();
  }

  Future<void> addNotification(String patientId, String title, String body) async {
    await notificationsRef.add({
      'receiverId': patientId,
      'title': title,
      'body': body,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> cancelAppointment(BuildContext context, AppointmentModel appt) async {
    try {
      await appointmentsRef.doc(appt.appointmentId).update({'status': 'canceled'});

      await addNotification(
        appt.patientId,
        'Appointment Canceled',
        'Dr. ${UserSession.currentDoctor?.name ?? 'Your doctor'} canceled your appointment scheduled on '
            '${appt.appointmentDate.day}/${appt.appointmentDate.month} at ${appt.appointmentTime}.',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Appointment canceled & notification sent")),
      );
      Navigator.pop(context);
    } catch (e) {
      debugPrint('❌ Error canceling appointment: $e');
    }
  }

  Future<void> completeAppointment(BuildContext context, AppointmentModel appt) async {
    try {
      await appointmentsRef.doc(appt.appointmentId).update({'status': 'done'});

      await addNotification(
        appt.patientId,
        'Appointment Completed',
        'Dr. ${UserSession.currentDoctor?.name ?? 'Your doctor'} marked your appointment as completed.',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Appointment done & notification sent")),
      );
      Navigator.pop(context);
    } catch (e) {
      debugPrint('❌ Error completing appointment: $e');
    }
  }

  Future<void> savePrescription(BuildContext context, AppointmentModel appt) async {
    final text = _prescriptionController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please write a prescription first"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() => _isSavingPrescription = true);

      await appointmentsRef.doc(appt.appointmentId).update({'prescription': text});

      await addNotification(
        appt.patientId,
        'New Prescription Added',
        'Dr. ${UserSession.currentDoctor?.name ?? 'Your doctor'} added a prescription for you.',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Prescription saved & notification sent"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      debugPrint('❌ Error saving prescription: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving prescription: $e"), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isSavingPrescription = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: const Text("Appointment Details", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: appointmentsRef.doc(widget.appointmentId).snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snap.hasData || !snap.data!.exists) {
            return const Center(child: Text("Appointment not found"));
          }

          // ✅ ثبت الـ appointmentId من doc.id
          final raw = snap.data!.data() as Map<String, dynamic>;
          final fixedMap = {...raw, 'appointmentId': snap.data!.id};
          final appointment = AppointmentModel.fromMap(fixedMap);

          // ✅ sync prescription
          final serverPrescription = (appointment.prescription ?? '');
          if (_prescriptionController.text.trim().isEmpty &&
              serverPrescription.trim().isNotEmpty) {
            _prescriptionController.text = serverPrescription;
          }

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Top card
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.blueColor.withOpacity(0.9),
                                AppColors.darkBlueColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage('lib/images/img.png'),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      appointment.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Age: ${appointment.age}  •  ${appointment.gender}",
                                      style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9)),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today, size: 16, color: Colors.white),
                                        const SizedBox(width: 6),
                                        Text(
                                          "${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year}",
                                          style: const TextStyle(fontSize: 13, color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        const Icon(Icons.access_time, size: 16, color: Colors.white),
                                        const SizedBox(width: 6),
                                        Text(
                                          appointment.appointmentTime,
                                          style: const TextStyle(fontSize: 13, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Appointment info
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appointment Info",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.medical_services),
                                  title: const Text("Type", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                  subtitle: Text(appointment.appointmentType, style: const TextStyle(fontSize: 14)),
                                ),
                                const Divider(),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.attach_money),
                                  title: const Text("Price", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                  subtitle: Text("${appointment.price.toStringAsFixed(0)} EGP",
                                      style: const TextStyle(fontSize: 14)),
                                ),
                                const Divider(),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.payment),
                                  title: const Text("Payment Method", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                  subtitle: Text(appointment.billingMethod, style: const TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Prescription
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.description, color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Prescription",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  controller: _prescriptionController,
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    hintText: "Write the prescription here for the patient...",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: AppColors.blueColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    onPressed: _isSavingPrescription
                                        ? null
                                        : () => savePrescription(context, appointment),
                                    icon: _isSavingPrescription
                                        ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                    )
                                        : const Icon(Icons.save),
                                    label: Text(_isSavingPrescription ? "Saving..." : "Save Prescription"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.blueColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom buttons
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => cancelAppointment(context, appointment),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            side: BorderSide(color: AppColors.blueColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: Text("Cancel", style: TextStyle(color: AppColors.blackColor, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => completeAppointment(context, appointment),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blueColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: const Text("Done", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
