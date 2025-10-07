import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/login_view.dart';
import 'package:health_care_app/core/constants/colors.dart';

class SignupTail extends StatelessWidget {
  const SignupTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Have an account?",
          style: TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
