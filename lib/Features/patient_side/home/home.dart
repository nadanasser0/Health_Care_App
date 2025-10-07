import 'package:flutter/material.dart' hide SearchBar;
import 'package:health_care_app/Features/patient_side/home/widget/header_section.dart';
import 'package:health_care_app/Features/patient_side/home/widget/recomendation_seaAll.dart';
import 'package:health_care_app/Features/patient_side/home/widget/reminder_card.dart';
import 'package:health_care_app/shared/widgets/recommendation_list.dart';
import 'package:health_care_app/Features/patient_side/home/widget/speciality_list.dart';
import 'package:health_care_app/Features/patient_side/home/widget/search_bar.dart';

// import '../../core/constants/colors.dart';
// import '../../shared/widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ////////////nav bar with floating action button
    // bottomNavigationBar: NavigationScreen(),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.blueColor,
      //   foregroundColor: AppColors.whiteColor,
      //   child: const Icon(Icons.search),
      //   onPressed: () {},
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(),
                SizedBox(height: 35),
                SearchBar(),
                SizedBox(height: 15),
                ReminderCard(),
                SizedBox(height: 15),
                SpecialityList(),
                SizedBox(height: 15),
                RecomendationSeaall(),
                RecommendationList(),
              ],
            ),
          ),
        ),
      ),






    );
  }
}
