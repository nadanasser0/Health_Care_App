import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/appointment/doctor_appoinment.dart';
import 'package:health_care_app/Features/doctor_side/home_screen/widgets/patient_card.dart';
import 'package:health_care_app/core/constants/colors.dart';

class HomeScreenD extends StatelessWidget {
  const HomeScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                "Hi. Omar!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "How Are You Today?",
                style: TextStyle(color: AppColors.greyColor),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Upcoming appointment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    backgroundColor: AppColors.purpuleColor,
                    radius: 16,
                    child: Text(
                      "4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorAppointment(),));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.cyanColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'lib/images/img.png',
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Mazen Shabara",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "General Checkup",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                child: Image(
                                  image: AssetImage(
                                    "lib/images/message-text.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.darkBlueColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Monday,25 june  |  11:00 AM",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Recent Patient",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: AppColors.purpuleColor,
                    radius: 16,
                    child: Text(
                      "4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorAppointment()));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => PatientCard(
                    name: "Mazen Shabara",
                    status: "General checkup",
                    imgPath: "lib/images/img.png",
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 7),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
