import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';



class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTabTap;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        controller: tabController,
        onTap: onTabTap,
        indicatorColor: AppColors.blueColor,
        labelColor: AppColors.blueColor,
        unselectedLabelColor: AppColors.greyColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        tabs: const [
          Tab(text: 'About'),
          Tab(text: 'Reviews'),
        ],
      ),
    );
  }
}