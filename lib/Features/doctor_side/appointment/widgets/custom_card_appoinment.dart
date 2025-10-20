import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomCardAppointment extends StatelessWidget {
  const CustomCardAppointment({super.key, required this.appointmentStatue, required this.day, required this.time, required this.color, required this.name, required this.status, required this.imgPath});
final String appointmentStatue;
final String day;
final String time;
final Color color;
final String name;
final String status;
final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(appointmentStatue,style: TextStyle(fontSize: 16,color: color,fontWeight: FontWeight.w500),),
        Text("$day | $time",style: TextStyle(fontSize: 12,color: AppColors.greyColor),),
        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imgPath),
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
