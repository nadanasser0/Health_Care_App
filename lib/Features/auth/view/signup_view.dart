import 'package:flutter/material.dart';
import 'package:health_care_app/features/auth/widgets/custom_button.dart';
import 'package:health_care_app/features/auth/widgets/signup_form.dart';
import 'package:health_care_app/features/auth/widgets/signup_header.dart';
import 'package:health_care_app/features/auth/widgets/signup_tail.dart';
import 'package:health_care_app/core/constants/colors.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SignupHeader(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SignupForm(
                  userNameController: userNameController,
                  emailController: emailController,
                  phoneNumberController: phoneNumberController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
                SizedBox(height: 40),
                CustomButton(text:"Sign up",onPressed:(){}),
                SizedBox(height: 40),
                SignupTail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
