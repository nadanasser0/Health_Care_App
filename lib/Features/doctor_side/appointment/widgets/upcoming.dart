import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';


class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      elevation: 2,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.greyColor.withOpacity(0.8),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/images/img.png'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Mazen Elsayed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.whiteColor,
                              elevation: 0,
                            ),
                            child: Image.asset(
                              'lib/images/message-text.png',
                              width: 30,
                              height: 30,
                              color: AppColors.blueColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "General Checkup",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Monday, 25 June | 11:00 AM",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 35),
                  side: BorderSide(color: AppColors.blueColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  "Cancel Appointment",
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            ),
          ),
        ],
      ),
    ), separatorBuilder:(context, index) =>  SizedBox(height: 1,), itemCount: 7);
  }
}
