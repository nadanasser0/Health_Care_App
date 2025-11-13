import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/signup_view.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/strings.dart';

class LoginTail extends StatelessWidget {
  const LoginTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30 , right: 5 , top: 50),
          child: Text(Strings.loginTail , textAlign: TextAlign.center,style: TextStyle(fontSize: 12 , color: AppColors.greyColor.withOpacity(0.8)),),
       
          
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

        Text("Don't have an account?" , style: TextStyle(color: AppColors.darkGreyColor , fontWeight: FontWeight.w400),),
        TextButton(onPressed:(){
          Navigator.push(context,
          MaterialPageRoute(builder:(context) => SignupView())
          );
        }, child: Text("Register",style: TextStyle(color: AppColors.blueColor,fontSize:18,fontWeight: FontWeight.bold),))
        ],)
      ],
    );
  }
}