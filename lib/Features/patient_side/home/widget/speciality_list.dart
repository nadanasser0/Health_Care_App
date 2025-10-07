import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/doctor%20speciality/Doctor_Speciality.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
// import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/data/specialist_data.dart';

class SpecialityList extends StatelessWidget {
  const SpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              Text(
                "Doctor Speciality",
                style: AppFonts.bodyBold.copyWith(color: AppColors.blackColor),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                   Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorSpecialityAll()),
              );
                //  Navigator.pushReplacementNamed(context, AppRoutes.doctorSpeciality);
                },
                child: Text(
                  "See All",
                  style: AppFonts.titleRegular.copyWith(
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 9),

        // Doctor Speciality widget
        SizedBox(
          height: 125,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
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
                    const SizedBox(height: 15),
                    Text(items[index].title, style: AppFonts.bodyRegular),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
