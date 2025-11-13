import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/forgot_password_widgets/forgot_password_header.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/forgot_password_widgets/forgotpassword_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/forgot_password_widgets/forgotpassword_field.dart';
import 'package:health_care_app/core/constants/colors.dart';

class ForgotpasswordView extends StatelessWidget {
  const ForgotpasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailorphone = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgotPasswordHeader(),
          // SizedBox(height: 20,),
          
          ForgotpasswordTextField(label:'Write your email', controller: emailorphone,),
          ForgotpasswordButton(text:'Reset Password',onPressedtext: (){}, email:emailorphone.text.trim(),),
        ],
      )
    );
  }
}