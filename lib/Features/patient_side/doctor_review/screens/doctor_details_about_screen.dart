import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/doctor_header_card.dart';
import '../widgets/make_appointment_button.dart';

class DoctorDetailsAboutScreen extends StatelessWidget {
  final String aboutMe;
  final String doctorName;
  final String specialty;
  final String hospitalName;
  final double rating;
  final String doctorImageUrl;
  final int numberOfReviews;
  final String workingDays;
  final String workingHours;
  final double str;
  final double price;
  final String experienceHospital;
  final String experienceYears;

  const DoctorDetailsAboutScreen({
    super.key,
    required this.aboutMe,
    required this.str,
    required this.price,
    required this.workingDays,
    required this.workingHours,
    required this.experienceHospital,
    required this.experienceYears,
    required this.doctorName,
    required this.specialty,
    required this.hospitalName,
    required this.rating,
    required this.doctorImageUrl,
    required this.numberOfReviews,
  });
// =======
// import 'package:health_care_app/Features/patient_side/doctor_review/screens/doctor_details_review_screen.dart';
// import 'package:health_care_app/Features/patient_side/doctor_review/widgets/custom_tab_bar.dart';
// import 'package:health_care_app/Features/patient_side/doctor_review/widgets/doctor_header_card.dart';
// import 'package:health_care_app/Features/patient_side/doctor_review/widgets/make_appointment_button.dart';
// import 'package:health_care_app/core/constants/colors.dart';
// import 'package:health_care_app/models/doctor_model.dart';
// import '../../../../shared/methods/navigator.dart';

// class DoctorDetailsAboutScreen extends StatefulWidget {
// const DoctorDetailsAboutScreen({super.key, this.doctor});
// final DoctorModel? doctor;

//   @override
//   State<DoctorDetailsAboutScreen> createState() =>
//       _DoctorDetailsAboutScreenState();
// }

// class _DoctorDetailsAboutScreenState extends State<DoctorDetailsAboutScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     if (_tabController.indexIsChanging && _tabController.index == 1) {
//       // If switching to Reviews tab, navigate to DoctorDetailsReviewScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => DoctorDetailsReviewScreen()),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _tabController.removeListener(_handleTabSelection);
//     _tabController.dispose();
//     super.dispose();
//   }
// >>>>>>> main

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  _buildSection("About Me", aboutMe),
                  _buildSection("Working Time", "$workingDays, $workingHours"),
                  _buildSection("STR", "$str"),
                  _buildSection("Price", "\$$price"),
                  _buildSection(
                    "Experience",
                    "$experienceHospital\n$experienceYears",
                  ),
                ],
              ),
            ),
          ),
          MakeAppointmentButton(
            doctorName: doctorName,
            specialty: specialty,
            hospitalName: hospitalName,
            rating: rating,
            doctorImageUrl: doctorImageUrl,
            numberOfReviews: numberOfReviews,
            workingDays: workingDays,
            workingHours: workingHours,
            price: price,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 14, color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
