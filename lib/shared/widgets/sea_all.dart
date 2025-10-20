import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

//                  SEEALL
class SEAALL extends StatelessWidget {
  const SEAALL({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        // navigator
        if (onTap != null) {
          onTap!();
        }
      },
      child: Text(
        "See All",
        style: AppFonts.bodyMedium.copyWith(color: AppColors.textColorBlue),
      ),
    );
  }
}
