import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/forgot_password/widgets/forgot_password_header.dart';
import 'package:health_care_app/Features/patient_side/forgot_password/widgets/forgotpassword_button.dart';
import 'package:health_care_app/Features/patient_side/forgot_password/widgets/forgotpassword_field.dart';
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
          ForgotpasswordTextField(label:'Email or Phone Number', controller:emailorphone,),
          ForgotpasswordButton(text:'Reset Password', onPressedButton: () { },onPressedtext: (){},),
        ],
      )
    );
  }
}