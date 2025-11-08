import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/shared/custom_textfeild.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/custom_dropDown_gende.dart';
// import 'package:health_care_app/shared/user_session.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController genderController;
  final GlobalKey<FormState> formkey;

  const SignupForm({
    super.key,
    // super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.genderController,
    required this.formkey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CustomTextField(
          //   label: "Enter your name",
          //   icon: Icons.person,
          //   controller: userNameController,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return "Please enter your name";
          //     }
          //     return null;
          //   },
          // ),
          CustomTextField(
            label: "Enter your name",
            icon: Icons.person,
            controller: userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }

              final parts = value.trim().split(' ');

              if (parts.length < 2) {
                return "Please enter your full name (first and last)";
              }

              for (var part in parts) {
                if (part.length < 3) {
                  return "Each part of your name must be at least 3 letters";
                }
              }

              return null;
            },
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

          // CustomTextField(
          //   label: "Enter your phone",
          //   icon: Icons.phone_callback,
          //   controller: phoneNumberController,

          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return "Please enter your phone number";
          //     }
          //     return null;
          //   },
          // ),
          
          CustomTextField(
            label: "Enter your phone",
            icon: Icons.phone_callback,
            controller: phoneNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your phone number";
              }

              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return "Phone number must contain only numbers";
              }

              if (value.length != 11) {
                return "Phone number must be 11 digits";
              }

              if (!value.startsWith("011")) {
                return "Phone number must start with 011";
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

          const SizedBox(height: 16),
          CustomGenderDropdown(controller: genderController),
        ],
      ),
    );
  }
}
