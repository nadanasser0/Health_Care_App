import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/shared/widgets/recommendation_list.dart';

class RecommendationDoctor extends StatefulWidget {
  const RecommendationDoctor({super.key});

  @override
  State<RecommendationDoctor> createState() => _RecommendationDoctorState();
}

class _RecommendationDoctorState extends State<RecommendationDoctor> {
  // show bottom sheet
  GlobalKey<ScaffoldState> showBottom = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: showBottom,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context,AppRoutes.home);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blackColor),
        ),
        title: Text("Recommendation ", style: AppFonts.titleMedium),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("three dotted .....");
            },
            icon: Icon(Icons.more_horiz, size: 30),
          ),
        ],
      ),

      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: AppColors.greyColor),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.blueColor,
                            ),
                            filled: true,
                            fillColor: AppColors.greyLightColor,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            print("Searching for: $value");
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("Sortedby");
                          showBottom.currentState!.showBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            (context) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white, // الخلفية بيضا
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 50,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: AppColors.greyColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: AppFonts.sizeBoxMedium),
                                      Center(
                                        child: Text(
                                          "Sorted By",
                                          style: AppFonts.bodyMedium,
                                        ),
                                      ),
                                      Divider(height: 30, thickness: 2),
                                      Text(
                                        "Speciality",
                                        style: AppFonts.bodyMedium,
                                      ),

                                      SizedBox(height: 200),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.sort, size: AppFonts.BigIcon),
                      ),
                    ],
                  ),
                  SizedBox(height: AppFonts.sizeBoxMedium),
                ],
              ),
              RecommendationList(),
            ],
          ),
        ),
      ),
    );
  }
}
