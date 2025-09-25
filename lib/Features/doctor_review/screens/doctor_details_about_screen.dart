import 'package:flutter/material.dart';
import 'package:health_care_app/features/doctor_review/screens/doctor_details_review_screen.dart';
import 'package:health_care_app/features/doctor_review/widgets/custom_tab_bar.dart';
import 'package:health_care_app/features/doctor_review/widgets/doctor_header_card.dart';
import 'package:health_care_app/features/doctor_review/widgets/make_appointment_button.dart';
import 'package:health_care_app/core/constants/colors.dart';

class DoctorDetailsAboutScreen extends StatefulWidget {
  const DoctorDetailsAboutScreen({super.key});

  @override
  State<DoctorDetailsAboutScreen> createState() => _DoctorDetailsAboutScreenState();
}

class _DoctorDetailsAboutScreenState extends State<DoctorDetailsAboutScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging && _tabController.index == 1) {
      // If switching to Reviews tab, navigate to DoctorDetailsReviewScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DoctorDetailsReviewScreen()),
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
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text(
          'Dr Randy Wigham',
          style: TextStyle(color: AppColors.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DoctorHeaderCard(
            doctorName: 'Dr. Randy Wigham',
            specialty: 'General',
            hospital: 'RSUD Gatot Subroto',
            rating: 4.8,
            numberOfReviews: 4279,
            doctorImageUrl: 'lib/images/doctor_avatar.png',
          ),
          const SizedBox(height: 8),
          CustomTabBar(
            tabController: _tabController,
            onTabTap: (index) {
              if (index == 1) {
                // If Reviews tab is tapped, navigate
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorDetailsReviewScreen()),
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About me',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dr. Jenny Watson is the top most immunologists specialist in Christ Hospital at London. She achieved several awards for her wonderful contribution in medical field. She is available for private consultation.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Working Time',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Monday - Friday, 08.00 AM - 20.00 PM',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'STR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '4726482464',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '110 \$',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pengalaman Praktik',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'RSPAD Gatot Soebroto',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  Text(
                    '2017 - sekarang',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreyColor,
                    ),
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