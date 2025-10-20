import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/recomendation_doctor.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/widget/RecomendationDoc.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.items});

  final List<RecomendationDoctorModel> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: RecomendationDoc(itemsReco: items));
  }
}
