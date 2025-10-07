import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/custom_textfeild.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [

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

        const SizedBox(height: 16),
        
        CustomTextField(
          label: "Enter your password",
          icon: Icons.lock_outline,
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
