import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        // IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios_new_rounded,
        //     size: 20,
        //     color: AppColors.greyColor,
        //   ),
        // ),
        
        // SizedBox(height: 2.5),
        Row(
          children: [
          SizedBox(width: 10),
          SizedBox(width: 10),
            Text(
              "Create Account",
              style: TextStyle(
                color: AppColors.blueColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 50),

        // Center(child: Image.asset(Strings.LogoPath, height: 50, width: 50)),
          Center(child: Image.asset(Strings.LogoPath, height: 30, width: 30)),
        Center(
          child: Text(
            "Register",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: AppColors.blueColor,
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
