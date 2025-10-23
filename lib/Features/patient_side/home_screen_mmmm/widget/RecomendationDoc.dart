//                RecomendationDoc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care_app/Features/patient_side/home_screen_mmmm/model/recomendation_doctor.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class RecomendationDoc extends StatelessWidget {
  const RecomendationDoc({super.key, required this.itemsReco});

  final List<RecomendationDoctorModel> itemsReco;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemsReco.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            SystemSound.play(SystemSoundType.click);
            //navigator
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  SystemSound.play(SystemSoundType.click);
                  /**
          *  بقا المفروض لما يضغط علي الدكتور يجيبلنا بيانات الدكتور ده ه 
    
           */
                },

                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColorBlue.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.backgroundColorBlue,
                        ),
                      ),
                      child: Image.asset(
                        itemsReco[index].imgUrl,
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(width: AppFonts.spaceMedium),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemsReco[index].name,
                            style: AppFonts.bodyLarge.copyWith(
                              color: AppColors.textColorBlack,
                            ),
                          ),
                          SizedBox(height: AppFonts.spaceSmall),
                          Text(itemsReco[index].specialist),
                          SizedBox(height: AppFonts.spaceSmall),
                          Row(
                            children: [
                              Image.asset(
                                "lib/images/Logo_splash.png",
                                height: 18,
                                width: 18,
                              ),
                              const SizedBox(width: 3),
                              Text("${itemsReco[index].rating}"),
                              SizedBox(width: 5),
                              Text("(${itemsReco[index].review} eviews) "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//
