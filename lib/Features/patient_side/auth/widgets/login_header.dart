import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.blueColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in',
            style: TextStyle(fontSize: 15, color: AppColors.greyColor),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
