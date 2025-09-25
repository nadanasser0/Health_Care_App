import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/core/routes/app_routes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // ترجع للصفحه اللي كنت واقف عليها تاني
            // Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blackColor),
        ),
        title: Text("Notification", style: AppFonts.titleBold),
        centerTitle: true,
        actions: [
          SizedBox(
            height: 45,
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                print("new message");
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: AppColors.blueColor,
                side: BorderSide(color: AppColors.whiteColor, width: 2),
              ),
              child: Text(
                "2\tNew",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Today", style: TextStyle(color: AppColors.greyColor)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      print("Mark all as read");
                    },
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              //1
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الأيقونة
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "lib/images/icons/calendar-tick.png",
                        width: 35,
                        height: 35,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // النص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Appointment Success",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Congratulations - your appointment is confirmed! "
                            "We're looking forward to meeting with you and helping you achieve your goals.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الوقت
                    const Text(
                      "1h",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              //2
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الأيقونة
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFEAF2FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "lib/images/icons/calendar-2.png",
                        width: 35,
                        height: 35,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // النص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Schedule Changed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "You have successfully changed "
                            "your appointment with Dr. Randy Wigham. Don't forget to active your reminder.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الوقت
                    Column(
                      children: [
                        const Text(
                          "5h",
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                        SizedBox(height: 10),

                        Image.asset(
                          "lib/images/icons/doteedred.png",
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///
              Text("Yesterday", style: TextStyle(color: AppColors.greyColor)),

              ///
              //1
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الأيقونة
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEEEF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "lib/images/icons/calendar-remove.png",
                        width: 35,
                        height: 35,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // النص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Appointment Cancelled",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "You have successfully canceled your appointment  with Dr. Randy Wigham. 50% of the funds will be returned to your account. ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الوقت
                    const Text(
                      "1h",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              //4
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الأيقونة
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFEAF2FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "lib/images/icons/calendar-2.png",
                        width: 35,
                        height: 35,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // النص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "New Payment Added!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Your payment has been successfully linked with Docdoc. ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الوقت
                    Column(
                      children: [
                        const Text(
                          "5h",
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                        SizedBox(height: 10),

                        Image.asset(
                          "lib/images/icons/doteedred.png",
                          width: 10,
                          height: 10,
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
  }
}
