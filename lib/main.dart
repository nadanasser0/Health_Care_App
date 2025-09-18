import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/doctor%20speciality/Doctor_Speciality.dart';
import 'package:health_care_app/Presentation/main%20screen/main_screen.dart';
import 'package:health_care_app/Presentation/notification/notification_screen.dart';
import 'package:health_care_app/Presentation/recommendation%20doctor/recommendation_doctor_sort.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),

        'DoctorSpeciality': (context) => const DoctorSpecialityAll(),
        "Notification": (context) => const NotificationScreen(),
        "RecomendationSeaall": (context) => const RecommendationDoctor(),
      },
    );
  }
}
