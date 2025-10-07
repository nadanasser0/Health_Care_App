import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

              ),
              child: Icon(Icons.person,size: 75,color: AppColors.blueColor,),
            )
          ],
        ),
        SizedBox(height: 10,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr. Randy Wigham",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            Text("General | RSUD Gatot Subroto",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xff616161),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  height: 30,
                  minWidth: 65,
                  color: AppColors.blueColor,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BookAppointment(),));
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color:AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                Icon(Icons.star,color: Colors.yellow,),
                Text("4.8 (4,279 reviews)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.greyColor,),),
              ],
            )
          ],
        )
      ],
    );
  }
}
