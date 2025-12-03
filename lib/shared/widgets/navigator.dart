import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:health_care_app/Features/patient_side/home_screen/home_screen.dart';
import 'package:health_care_app/Features/patient_side/search/search_screen.dart';
import 'package:health_care_app/Features/patient_side/chats/view/chats_list_screen.dart';
import 'package:health_care_app/Features/patient_side/profile/view/profile_view.dart';
import 'package:health_care_app/core/constants/colors.dart';

import '../../Features/patient_side/appointment_details_patient/patient_appointments_screen.dart';

class NavigationnScreen extends StatefulWidget {
  NavigationnScreen({super.key});

  static String id = '/navBottom';

  @override
  State<NavigationnScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationnScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    PatientAppointmentsScreen(),
    SearchScreen(),
    ChatsListScreen(),
    ProfilePatientScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final int gapIndex = pages.length ~/ 2;
    int navActiveIndex;

    if (pageIndex == gapIndex) {
      navActiveIndex = -1;
    } else if (pageIndex > gapIndex) {
      navActiveIndex = pageIndex - 1;
    } else {
      navActiveIndex = pageIndex;
    }

    return Scaffold(
      body: IndexedStack(index: pageIndex, children: pages),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = gapIndex;
          });
        },
        backgroundColor: AppColors.backgroundColorBlue,
        child: const Icon(Icons.search, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          CupertinoIcons.home,
          CupertinoIcons.calendar,
          CupertinoIcons.chat_bubble,
          CupertinoIcons.profile_circled,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: AppColors.backgroundColorBlue,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        iconSize: 25,
        notchSmoothness: NotchSmoothness.softEdge,
        activeIndex: navActiveIndex,

        onTap: (index) {
          final int actualIndex =
          index >= (pages.length ~/ 2) ? index + 1 : index;
          setState(() {
            pageIndex = actualIndex;
          });
        },
      ),
    );
  }
}