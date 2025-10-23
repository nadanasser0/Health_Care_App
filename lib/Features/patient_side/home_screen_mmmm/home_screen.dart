import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/doctor_specialist.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/recomendation_doctor.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/widget/CarsouseSlide.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/widget/DoctorSpecialist.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/widget/RecomendationDoc.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/widget/header.dart';
import 'package:health_care_app/Features/patient_side/recommendation_doctor_mmmmm/recommendation.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/shared/widgets/sea_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //    scroll automatic
  List<String> imageView = [
    "lib/images/ListView3.png",
    "lib/images/ListView1.jpeg",
    "lib/images/listView2.jpeg",
    "lib/images/listView4.jpeg",
  ];

  // search
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  // function search
  List<RecomendationDoctorModel> get filteredDoctors {
    if (searchQuery.isEmpty) return itemsReco; // لو مفيش بحث، رجّع كل الدكاترة
    return itemsReco.where((doctor) {
      final nameLower = doctor.name.toLowerCase();
      final specLower = doctor.specialist.toLowerCase();
      final query = searchQuery.toLowerCase();
      return nameLower.contains(query) || specLower.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //               header
                HeaderWidget(),
                SizedBox(height: AppFonts.spaceMedium),
                CarsouseSlide(imageView: imageView),
                //                search
                SizedBox(height: AppFonts.spaceMedium),
                Divider(color: AppColors.backgroundGrey, thickness: 1.25),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by name or specialist',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.backgroundColorBlue,
                        width: 3,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // تحديث الكلمة اللي المستخدم بيكتبها
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                    searchController.clear(); // Enter  يمسح النص بعد ما يضغط
                  },
                ),
                SizedBox(height: AppFonts.spaceSmall),
                Divider(color: AppColors.backgroundGrey, thickness: 1.25),
                SizedBox(height: AppFonts.spaceSmall),

                //  My Medications
                /**             MedicineReminder(),           */
                DoctorSpecialistWidget(items: items),
                //      recommendation doctor
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Recommendation Doctor",
                          style: AppFonts.bodyLarge.copyWith(
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        Spacer(),
                        SEAALL(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Recommendation(itemsReco: filteredDoctors),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: AppFonts.spaceSmall),
                    RecomendationDoc(itemsReco: filteredDoctors),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
