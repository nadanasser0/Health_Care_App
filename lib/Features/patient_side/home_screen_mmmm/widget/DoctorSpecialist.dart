//             DoctorSpecialist
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care_app/Features/patient_side/doctor_specialisty_mmmmm/speciality.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/doctor_specialist.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/shared/widgets/sea_all.dart';

class DoctorSpecialistWidget extends StatelessWidget {
  const DoctorSpecialistWidget({super.key, required this.items});

  final List<DoctorSpecialist> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Doctor Speciality",
              style: AppFonts.bodyLarge.copyWith(
                color: AppColors.textColorBlack,
              ),
            ),
            Spacer(),
            SEAALL(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Speciality(items: items),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: AppFonts.spaceMedium),
        // Doctor Speciality
        SizedBox(
          height: 125,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkWell(
                  onTap: () {
                    SystemSound.play(SystemSoundType.click);
                    /**
              *  هنا بقا المفروض لما يضغط علي التخصص يجيبلنا بيانات الدكاتره اللي ف المجال ده 

               */
                  },

                  child: Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColorBlue.withOpacity(
                            0.08,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipOval(
                            child: Image.asset(
                              items[index].imgUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppFonts.spaceMedium),
                      Text(items[index].title, style: AppFonts.bodyMedium),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Divider(color: AppColors.backgroundGrey, thickness: 1.25),
        SizedBox(height: AppFonts.spaceSmall),
      ],
    );
  }
}
