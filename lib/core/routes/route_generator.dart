import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/signup_view.dart';
// import 'package:health_care_app/Features/patient_side/doctor%20speciality/Doctor_Speciality.dart';
// import 'package:health_care_app/Features/patient_side/home/home.dart';
// import 'package:health_care_app/Features/patient_side/loginORsignup/loginORsignup.dart';
// import 'package:health_care_app/Features/patient_side/main%20screen/main_screen.dart';
// import 'package:health_care_app/Features/patient_side/notification/notification_screen.dart';
// import 'package:health_care_app/Features/patient_side/onboarding/onboarding.dart';
// import 'package:health_care_app/Features/patient_side/recommendation%20doctor/recommendation_doctor_sort.dart';
// import 'package:health_care_app/Features/patient_side/splash_screen/splash.dart';
// import 'package:health_care_app/Features/patient_side/forgot_password/view/forgotpassword_view.dart';
import 'package:health_care_app/shared/methods/navigator.dart';
// import 'package:health_care_app/shared/methods/navigator.dart';

import 'package:health_care_app/Features/patient_side/doctor%20speciality/Doctor_Speciality.dart';
// import 'package:health_care_app/Features/patient_side/home/home.dart';
import 'package:health_care_app/Features/patient_side/auth/view/loginORsignup.dart';
// import 'package:health_care_app/Features/patient_side/main%20screen/main_screen.dart';
import 'package:health_care_app/Features/patient_side/notification/notification_screen.dart';
import 'package:health_care_app/Features/patient_side/splash&onboarding/onboarding.dart';
// import 'package:health_care_app/Features/patient_side/recommendation%20doctor/recommendation_doctor_sort.dart';
import 'package:health_care_app/Features/patient_side/splash&onboarding/splash.dart';
import 'package:health_care_app/Features/patient_side/auth/view/forgotpassword_view.dart';

import 'app_routes.dart';
import '../../Features/patient_side/auth/view/login_view.dart';
// import '../../Features/patient_side/profile/view/profile_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.forgotPassowrd:
        return MaterialPageRoute(builder: (_) => const ForgotpasswordView());
      case AppRoutes.loginOrSignup:
        return MaterialPageRoute(builder: (_) => const LoginOrSignup());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      // case AppRoutes.doctorSpeciality:
      //   return MaterialPageRoute(builder: (_) => const DoctorSpecialityAll());
      // case AppRoutes.recommendationDoctor:
      //   return MaterialPageRoute(builder: (_) => const RecommendationDoctor());
      // case AppRoutes.notification:
      //   return MaterialPageRoute(builder: (_) => const NotificationScreen());
      // case AppRoutes.mainScreen:
        // return MaterialPageRoute(builder: (_) => NavigationScreen());
      // case AppRoutes.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page Not Found"))),
        );
    }
  }
}
