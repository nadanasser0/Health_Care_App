import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/auth/view/login_view.dart';
import 'package:health_care_app/Presentation/auth/view/signup_view.dart';
import 'package:health_care_app/Presentation/splash_screen/splash.dart';

import 'Presentation/book/book_appointment.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
