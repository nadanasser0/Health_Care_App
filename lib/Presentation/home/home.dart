import 'package:flutter/material.dart' hide SearchBar;
import 'package:health_care_app/Presentation/home/widget/header_section.dart';
import 'package:health_care_app/Presentation/home/widget/recomendation_seaAll.dart';
import 'package:health_care_app/Presentation/home/widget/reminder_card.dart';
import 'package:health_care_app/widget/recommendation_list.dart';
import 'package:health_care_app/Presentation/home/widget/speciality_list.dart';
import 'package:health_care_app/Presentation/home/widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(leading: SizedBox.shrink(), leadingWidth: 0),
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
