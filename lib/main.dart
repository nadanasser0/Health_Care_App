import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/log_in/view/login_view.dart';
import 'package:health_care_app/Presentation/splash_screen/splash.dart';

import 'Presentation/book/book_appointment.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookAppointment(),
    );
  }
}
