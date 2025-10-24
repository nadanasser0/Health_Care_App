import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/screens/doctor_details_about_screen.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/widgets/custom_tab_bar.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/widgets/doctor_header_card.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/widgets/make_appointment_button.dart';
import 'package:health_care_app/Features/patient_side/doctor_review/widgets/review_card.dart';
import 'package:health_care_app/core/constants/colors.dart';


class DoctorDetailsReviewScreen extends StatefulWidget {
  const DoctorDetailsReviewScreen({super.key});

  @override
  State<DoctorDetailsReviewScreen> createState() =>
      _DoctorDetailsReviewScreenState();
}

class _DoctorDetailsReviewScreenState extends State<DoctorDetailsReviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    ); // Start on Reviews tab
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging && _tabController.index == 0) {
      // If switching to About tab, navigate to DoctorDetailsAboutScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DoctorDetailsAboutScreen()),
      );
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: AppColors.whiteColor,
      //         borderRadius: BorderRadius.circular(12),
      //         border: Border.all(
      //           color: AppColors.greyColor.withOpacity(0.5),
      //           width: 1.5,
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: AppColors.blackColor.withOpacity(0.1),
      //             blurRadius: 4,
      //             offset: Offset(0, 2),
      //           ),
      //         ],
      //       ),
      //       child: IconButton(
      //         icon: Icon(Icons.arrow_back_ios, size: 18),
      //         color: AppColors.blackColor,
      //         onPressed: () {
      //           // Handle more options
      //         },
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     'Dr Randy Wigham',
      //     style: TextStyle(color: AppColors.blackColor),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: AppColors.whiteColor,
      //           borderRadius: BorderRadius.circular(12),
      //           border: Border.all(
      //             color: AppColors.greyColor.withOpacity(0.5),
      //             width: 1.5,
      //           ),
      //           boxShadow: [
      //             BoxShadow(
      //               color: AppColors.blackColor.withOpacity(0.1),
      //               blurRadius: 4,
      //               offset: Offset(0, 2),
      //             ),
      //           ],
      //         ),
      //         child: IconButton(
      //           icon: Icon(Icons.more_horiz, size: 22),
      //           color: AppColors.blackColor,
      //           onPressed: () {
      //             // Handle more options
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
       leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.5),
                width: 1 ,
              ),
              // boxShadow: [
                // BoxShadow(
                //   color: AppColors.blackColor.withOpacity(0.1),
                //   blurRadius: 4,
                //   offset: const Offset(0, 2),
                // ),
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left :5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 22),
                color: AppColors.blackColor,
                onPressed: () {
                    Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorDetailsAboutScreen()));
                },
              ),
            ),
          ),
        ),
        title: Text(
          'Dr Randy Wigham',
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
        // // actions: [
        // //   Padding(
        // //     padding: const EdgeInsets.all(8.0),
        // //     child: Container(
        // //       decoration: BoxDecoration(
        // //         color: AppColors.whiteColor,
        // //         borderRadius: BorderRadius.circular(12),
        // //         border: Border.all(
        // //           color: AppColors.greyColor.withOpacity(0.5),
        // //           width: 1.5,
        // //         ),
        // //         boxShadow: [
        // //           BoxShadow(
        // //             color: AppColors.blackColor.withOpacity(0.1),
        // //             blurRadius: 4,
        // //             offset: Offset(0, 2),
        // //           ),
        // //         ],
        //       ),
        //       child: IconButton(
        //         icon: Icon(Icons.more_horiz, size: 22),
        //         color: AppColors.blackColor,
        //         onPressed: () {
        //           // Handle more options
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DoctorHeaderCard(
              doctorName: 'Dr. Randy Wigham',
              specialty: 'General',
              hospital: 'RSUD Gatot Subroto',
              rating: 4.8,
              numberOfReviews: 4279,
              doctorImageUrl: 'lib/images/doctor_avatar.png',
            ),
          ),
          const SizedBox(height: 8),
          CustomTabBar(
            tabController: _tabController,
            onTabTap: (index) {
              if (index == 0) {
                // If About tab is tapped, navigate
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDetailsAboutScreen(),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  ReviewCard(
                    reviewerName: 'Jane Cooper',
                    reviewerImageUrl: 'lib/images/jane_cooper.png',
                    rating: 5,
                    reviewText:
                        'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
                    timeAgo: 'Today',
                  ),
                  ReviewCard(
                    reviewerName: 'Robert Fox',
                    reviewerImageUrl: 'lib/images/robert_fox.png',
                    rating: 5,
                    reviewText:
                        'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.',
                    timeAgo: 'Today',
                  ),
                  ReviewCard(
                    reviewerName: 'Jacob Jones',
                    reviewerImageUrl: 'lib/images/jacob_jones.png',
                    rating: 5,
                    reviewText:
                        'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.',
                    timeAgo: 'Today',
                  ),
                ],
              ),
            ),
          ),
          const MakeAppointmentButton(),
        ],
      ),
    );
  }
}
