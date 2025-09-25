import 'package:flutter/material.dart';
import 'package:health_care_app/Features/auth/view/signup_view.dart';
import 'package:health_care_app/Features/doctor%20speciality/Doctor_Speciality.dart';
import 'package:health_care_app/Features/home/home.dart';
import 'package:health_care_app/Features/loginORsignup/loginORsignup.dart';
import 'package:health_care_app/Features/notification/notification_screen.dart';
import 'package:health_care_app/Features/onboarding/onboarding.dart';
import 'package:health_care_app/Features/recommendation%20doctor/recommendation_doctor_sort.dart';
import 'package:health_care_app/Features/splash_screen/splash.dart';
import 'package:health_care_app/features/forgot_password/view/forgotpassword_view.dart';
import 'app_routes.dart';
import '../../features/auth/view/login_view.dart';
// import '../../features/profile/view/profile_view.dart';

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
      case AppRoutes.doctorSpeciality:
        return MaterialPageRoute(builder: (_) => const DoctorSpecialityAll());
      case AppRoutes.recommendationDoctor:
        return MaterialPageRoute(builder: (_) => const RecommendationDoctor());
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());


      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page Not Found"))),
        );
    }
  }
}
