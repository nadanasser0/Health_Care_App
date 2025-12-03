import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/splash&onboarding/splash.dart';
import 'package:firebase_core/firebase_core.dart';
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
      home: Splash(),
      // initialRoute: "/",
      // routes: {
      
        // "/": (context) => NavigationnScreen()

        // },
    );
  }
}
