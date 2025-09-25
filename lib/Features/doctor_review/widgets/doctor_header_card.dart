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
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(doctorImageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  hospital,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.starColor,
                      size: 20,
                    ),
                    Text(
                      '$rating ($numberOfReviews reviews)',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
 
            },
            icon: Icon(
              Icons.chat_bubble_outline,
              color: AppColors.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}