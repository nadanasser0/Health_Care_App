import 'package:flutter/material.dart';
import 'package:health_care_app/services/firestore_services.dart';
import '../../../../core/constants/colors.dart';
import '../../../../models/doctor_model.dart';
import '../widgets/doctor_header_card.dart';
import 'doctor_details_about_screen.dart';
import 'doctor_details_review_screen.dart';

class DoctorDetailsTabbarScreen extends StatelessWidget {
  const DoctorDetailsTabbarScreen({
    super.key, required this.docModel,
    required this.doctorId, 
    // required this.aboutMe,
    // required this.doctorName,
    // required this.specialty,
    // required this.hospitalName,
    // required this.rating,
    // required this.doctorImageUrl,
    // required this.numberOfReviews,
    // required this.workingDays,
    // required this.workingHours,
    // required this.str,
    // required this.price,
    // required this.experienceHospital,
    // required this.experienceYears,
  });

  final String doctorId; 
  // final String aboutMe;
  // final String doctorName;
  // final String specialty;
  // final String hospitalName;
  // final double rating;
  // final String doctorImageUrl;
  // final int numberOfReviews;
  // final String workingDays;
  // final String workingHours;
  // final double str;
  // final double price;
  // final String experienceHospital;
  // final String experienceYears;
   final DoctorModel docModel ; 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: const Text(
            "Doctor Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            // ✅ الكارت العلوي لمعلومات الدكتور
            DoctorHeaderCard(
              doctorName: docModel.name,
              specialty: docModel.specialization,
              hospital: docModel.hospital,
              rating: docModel.rating,
              numberOfReviews: docModel.reviews,
              doctorImageUrl: docModel.imageUrl,
            ),

            // ✅ التاب بار
            TabBar(
              labelColor: AppColors.blueColor,
              unselectedLabelColor: AppColors.greyColor,
              indicatorColor: AppColors.blueColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "About"),
                Tab(text: "Reviews"),
              ],
            ),

            // ✅ محتوى كل تاب
            Expanded(
              child: TabBarView(
                children: [

FutureBuilder<DoctorModel>(
  future: FirestoreService().getDoctor(doctorId),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError || !snapshot.hasData) {
      return const Center(child: Text('Error loading doctor'));
    }
    final doctor = snapshot.data!;
    return DoctorDetailsAboutScreen(doctor: doctor);
  },
),

// ✅ هنا نمرر الـ doctorId القادم من Firestore
DoctorDetailsReviewScreen(doctorId: doctorId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
