import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/navigation_screen.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/view/doctor_profile.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/core/routes/route_generator.dart';
import 'package:health_care_app/firebase_options.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: "/",
      // routes: {"/": (context) => NavigationScreen()},
    );
  }
}
