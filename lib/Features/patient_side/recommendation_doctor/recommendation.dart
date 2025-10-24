import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/home_screen/model/recomendation_doctor.dart';
import 'package:health_care_app/Features/patient_side/recommendation_doctor/widget/doctor_list_view.dart';
import 'package:health_care_app/Features/patient_side/recommendation_doctor/widget/search_and_sort_bar.dart';
import 'package:health_care_app/Features/patient_side/recommendation_doctor/widget/sort_bottom_sheet.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key, required this.itemsReco});

  final List<RecomendationDoctorModel> itemsReco;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  String selectedSpeciality = 'All';
  int selectedRating = 0;

  List<RecomendationDoctorModel> get filteredDoctors {
    List<RecomendationDoctorModel> list = widget.itemsReco;

    if (searchQuery.isNotEmpty) {
      list = list.where((doctor) {
        final nameLower = doctor.name.toLowerCase();
        final specLower = doctor.specialist.toLowerCase();
        final query = searchQuery.toLowerCase();
        return nameLower.contains(query) || specLower.contains(query);
      }).toList();
    }

    if (selectedSpeciality != 'All') {
      list = list
          .where(
            (doctor) => doctor.specialist.toLowerCase().contains(
              selectedSpeciality.toLowerCase(),
            ),
          )
          .toList();
    }

    if (selectedRating > 0) {
      list = list
          .where(
            (doctor) =>
                doctor.rating >= selectedRating &&
                doctor.rating < selectedRating + 1,
          )
          .toList();
    }

    return list;
  }

  void _openSortSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.textColorWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return SortBottomSheet(
          selectedSpeciality: selectedSpeciality,
          selectedRating: selectedRating,
          onApply: (spec, rate) {
            setState(() {
              selectedSpeciality = spec;
              selectedRating = rate;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recommendation Doctor",
          style: AppFonts.titleSmall.copyWith(color: AppColors.textColorBlack),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchAndSortBar(
            controller: searchController,
            onSearchChanged: (v) => setState(() => searchQuery = v),
            onSortPressed: _openSortSheet,
          ),
          SizedBox(height: AppFonts.spaceSmall),
          Expanded(child: DoctorListView(items: filteredDoctors)),
        ],
      ),
    );
  }
}
