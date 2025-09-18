import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class RecomendationSeaall extends StatelessWidget {
  const RecomendationSeaall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Recommendation Doctor",
          style: AppFonts.bodyBold.copyWith(color: AppColors.blackColor),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed("RecomendationSeaall");
          },
          child: Text(
            "See All",
            style: AppFonts.titleRegular.copyWith(color: AppColors.blueColor),
          ),
        ),
      ],
    );
  }
}
