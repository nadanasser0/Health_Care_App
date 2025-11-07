import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 🧑‍⚕️ صورة أو أيقونة الطبيب
        Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 60,
            color: AppColors.blueColor,
          ),
        ),

        const SizedBox(width: 15), // بدل الـ height:10 (الغلط هنا كانت المسافة أفقية مش رأسية)

        // 🧾 بيانات الطبيب
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dr. Randy Wigham",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "General | RSUD Gatot Subroto",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff616161),
                ),
              ),
              const SizedBox(height: 8),

              // 🔘 الزر والتقييم
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    "4.8 (4,279 reviews)",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
