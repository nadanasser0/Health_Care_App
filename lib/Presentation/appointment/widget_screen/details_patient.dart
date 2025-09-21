import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class DetailsPatient extends StatelessWidget {
  const DetailsPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Booking for:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.purpleColor),),
            Text("For someone else",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.darkGreyColor),),

          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Full Name:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.purpleColor),),
            Text("Mazen Shabara",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.darkGreyColor),),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Age:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.purpleColor),),
            Text("22",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.darkGreyColor),),

          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Gender:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color:AppColors.purpleColor),),
            Text("Male",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.darkGreyColor),),
          ],
        ),
      ],
    );
  }
}
