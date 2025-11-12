import 'package:flutter/material.dart';
import 'package:health_care_app/services/firestore_services.dart';
import '../../../../core/constants/colors.dart';
import '../../../../models/doctor_model.dart';
import '../widgets/doctor_header_card.dart';
import 'doctor_details_about_screen.dart';
import 'doctor_details_review_screen.dart';

class DoctorDetailsTabbarScreen extends StatelessWidget {
  const DoctorDetailsTabbarScreen({
    super.key,
    required this.docModel,
    required this.doctorId,
  });

  final String doctorId;
  final DoctorModel docModel;

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
            // ✅ StreamBuilder لتحديث الكارت تلقائيًا من Firestore
            StreamBuilder<DoctorModel>(
              stream: FirestoreService().streamDoctorData(doctorId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 150,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!snapshot.hasData || snapshot.hasError) {
                  // لو مفيش داتا، نعرض القديمة
                  return DoctorHeaderCard(
                    doctorName: docModel.name,
                    specialty: docModel.specialization,
                    hospital: docModel.hospital,
                    rating: docModel.rating,
                    numberOfReviews: docModel.reviews,
                    doctorImageUrl: docModel.imageUrl,
                  );
                }

                final updatedDoctor = snapshot.data!;

                return DoctorHeaderCard(
                  doctorName: updatedDoctor.name,
                  specialty: updatedDoctor.specialization,
                  hospital: updatedDoctor.hospital,
                  rating: updatedDoctor.rating,
                  numberOfReviews: updatedDoctor.reviews,
                  doctorImageUrl: updatedDoctor.imageUrl,
                );
              },
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
