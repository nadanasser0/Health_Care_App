import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class DoctorHeaderCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String hospital;
  final double rating;
  final int numberOfReviews;
  final String doctorImageUrl;

  const DoctorHeaderCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.numberOfReviews,
    required this.doctorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: AppColors.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              doctorImageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                ),
                Text(
                  hospital,
                  style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.starColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$rating (${numberOfReviews} reviews)',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Spacer(),
          Image.asset(
            'lib/images/message-text.png',
            width: 25,
            height: 25,
            color: AppColors.blueColor,
          ),
        ],
      ),
    );
  }
}
