import 'package:flutter/material.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/core/routes/route_generator.dart';
// import 'package:health_care_app/Presentation/log_in/view/login_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.splash,
      onGenerateRoute:RouteGenerator.generateRoute,
    );
  }
}
