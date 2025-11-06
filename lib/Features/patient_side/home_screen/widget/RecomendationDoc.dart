import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/screens/doctor_details_tabBar.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/Features/patient_side/home_screen/model/recomendation_doctor.dart';

import '../../doctor_review/screens/doctor_details_about_screen.dart';

class RecomendationDoc extends StatelessWidget {
  const RecomendationDoc({super.key, this.searchQuery = ''});

  final String searchQuery;

  Stream<List<RecomendationDoctorModel>> _stream() {
    return FirebaseFirestore.instance
        .collection('doctors')
        .where('isRecommended', isEqualTo: true)
        .orderBy('rating', descending: true)
        .snapshots()
        .map(
          (s) =>
              s.docs.map((d) => RecomendationDoctorModel.fromDoc(d)).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final q = searchQuery.trim().toLowerCase();
    return StreamBuilder<List<RecomendationDoctorModel>>(
      stream: _stream(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final list = (snap.data ?? []);
        final filtered = q.isEmpty
            ? list
            : list
                  .where(
                    (d) =>
                        d.name.toLowerCase().contains(q) ||
                        d.specialization.toLowerCase().contains(q),
                  )
                  .toList();

        if (filtered.isEmpty) {
          return const Center(child: Text("No recommended doctors found."));
        }

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filtered.length,
          itemBuilder: (context, i) {
            final d = filtered[i];
            final hasHospital = (d.hospital ?? '').trim().isNotEmpty;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDetailsTabbarScreen(
                      aboutMe: "aboutMe",
                      doctorName: d.name,
                      specialty: d.specialization,
                      hospitalName: d.hospital,
                      rating: 3.5,
                      doctorImageUrl: "lib/images/doctor_avatar.png",
                      numberOfReviews: 3,
                      workingDays: "5",
                      workingHours: "2",
                      str: 5,
                      price: 150,
                      experienceHospital: "experienceHospital",
                      experienceYears: "experienceYears", doctorId: d.id,
                    ),
                  ),
                );
                // wafaa & mariam
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: d.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (_, __, ___) =>
                              const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d.name,
                              style: AppFonts.bodyLarge.copyWith(
                                color: AppColors.textColorBlack,
                              ),
                            ),
                            const SizedBox(height: 5),

                            Text(
                              hasHospital
                                  ? '${d.specialization} • ${d.hospital}'
                                  : d.specialization,
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text("${d.rating}"),
                                const SizedBox(width: 4),
                                Text("(${d.reviews} reviews)"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
