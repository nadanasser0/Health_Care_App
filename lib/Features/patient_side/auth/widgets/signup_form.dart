import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/custom_textfeild.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupForm({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTextField(
          label: "Enter your name",
          icon: Icons.person,
          controller: emailController,
        ),

        SizedBox(height: 20),

        CustomTextField(
          label: "Enter your email",
          icon: Icons.email_outlined,
          controller: emailController,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
        ),

        SizedBox(height: 20),

        CustomTextField(
          label: "Enter your phone",
          icon: Icons.phone_callback,
          controller: emailController,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
        ),

        const SizedBox(height: 16),

        CustomTextField(
          label: "Enter your password",
          icon: Icons.lock_outline_rounded,
          controller: passwordController,
          isPassword: true,
          validator: (value) {
            if (value == null || value.length < 8) {
              return "Password must be at least 8 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
}
