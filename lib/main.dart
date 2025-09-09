import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/log_in/view/login_view.dart';
import 'package:health_care_app/Presentation/onboarding/onboarding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
