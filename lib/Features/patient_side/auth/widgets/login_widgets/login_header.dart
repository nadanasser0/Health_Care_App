import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/loginORsignup.dart';
import 'package:health_care_app/core/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, AppRoutes.loginOrSignup);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginOrSignup()));
            
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.greyColor,
            size: 20,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20, right: 130,bottom: 20),
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
              SizedBox(height: 10),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in',
                style: TextStyle(fontSize: 15, color: AppColors.greyColor),
                overflow: TextOverflow.fade,
              ),

            ],
          ),
        ),
        // SizedBox(height: 30),
      ],
    );
  }
}
