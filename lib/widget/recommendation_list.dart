import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/data/doctor_data.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // يخلي العنوان شمال
      children: [
        const SizedBox(height: 18),

        // doctor list
        ListView.builder(
          shrinkWrap: true, // عشان يشتغل جوا Column
          physics:
              const NeverScrollableScrollPhysics(), // ما يعملش Scroll لوحده
          itemCount: docDetails.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // نحط named
                Navigator.of(context, rootNavigator: true).pushNamed("");
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset(
                        docDetails[index].imgUrl,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              docDetails[index].name,
                              style: AppFonts.bodyBold,
                            ),
                            const SizedBox(height: 10),
                            Text(docDetails[index].specialized),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Image.asset(
                                  "lib/images/icons/magic-star.png",
                                  height: 18,
                                  width: 18,
                                ),
                                const SizedBox(width: 3),
                                Text(docDetails[index].rate),
                                const SizedBox(width: 5),
                                Text(
                                  "(${docDetails[index].numberRate}) reviews",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
