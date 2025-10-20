import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_avatar.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_info_row.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/custom_doctor_navbar.dart';

class DoctorPersonalInfo extends StatefulWidget {
  const DoctorPersonalInfo({super.key});

  @override
  State<DoctorPersonalInfo> createState() => _DoctorPersonalInfoState();
}

class _DoctorPersonalInfoState extends State<DoctorPersonalInfo> {
  final TextEditingController _nameController =
      TextEditingController(text: "Dr. Nada Nasser");
  final TextEditingController _emailController =
      TextEditingController(text: "nada1234@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "01113583479");

  /// بدل boolean عام، نستخدم متغير بيخزن اسم الحقل المفتوح حاليًا
  String? _editingField; // ممكن تكون "name" أو "email" أو "phone"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomDoctorNavbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [CustomDoctorAvatar(docName: 'Nada Nasser')],
              ),
            ),

            const SizedBox(height: 20),

            /// Name Row
            CustomDoctorInfoRow(
              controller: _nameController,
              isEditable: _editingField == "name", // مفتوح فقط لو الحقل الحالي هو "name"
              onEditTap: () {
                setState(() {
                  _editingField =
                      _editingField == "name" ? null : "name"; // toggle
                });
              },
            ),

            /// Email Row
            CustomDoctorInfoRow(
              controller: _emailController,
              isEditable: _editingField == "email",
              onEditTap: () {
                setState(() {
                  _editingField =
                      _editingField == "email" ? null : "email";
                });
              },
            ),

            /// Phone Row
            CustomDoctorInfoRow(
              controller: _phoneController,
              isEditable: _editingField == "phone",
              onEditTap: () {
                setState(() {
                  _editingField =
                      _editingField == "phone" ? null : "phone";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
