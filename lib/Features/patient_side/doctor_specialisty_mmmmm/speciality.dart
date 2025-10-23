import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/doctor_specialist.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class Speciality extends StatelessWidget {
  const Speciality({super.key, required this.items});
  // items
  final List<DoctorSpecialist> items;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor Speciality",
          style: AppFonts.titleSmall.copyWith(color: AppColors.textColorBlack),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
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
                      color: AppColors.backgroundColorBlue.withOpacity(0.08),
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
            );
          },
        ),
      ),
    );
  }
}
