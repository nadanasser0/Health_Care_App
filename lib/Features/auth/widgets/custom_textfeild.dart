import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  // final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    // this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.greyColor.withOpacity(0.02),

        labelText: label,
        labelStyle: TextStyle(color: AppColors.greyColor, fontSize: 14),

        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : null,
        prefixIcon: Icon(icon),
        focusColor: AppColors.blueColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.textFieldSize),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.1),
            width: 1.5,
          ), 
          borderRadius: BorderRadius.circular(AppSizes.textFieldSize),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueColor,
            width: 2,
          ), 
          borderRadius: BorderRadius.circular(AppSizes.textFieldSize),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1.5,
          ), 
          borderRadius: BorderRadius.circular(AppSizes.textFieldSize),
        ),
      ),

      obscureText: isPassword,
      // keyboardType: keyboardType,
      validator: validator,
    );
  }
}
