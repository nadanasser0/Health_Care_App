import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:health_care_app/Features/patient_side/calender/calender_screen.dart';
import 'package:health_care_app/Features/patient_side/chats/view/chat_details_screen.dart';
import 'package:health_care_app/Features/patient_side/home/home.dart';
// import 'package:health_care_app/Features/patient_side/profile/profile_screen.dart';
import 'package:health_care_app/core/constants/colors.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CalenderScreen(),
    ChatPage(chatName:'Nada Nasser',),
    ChatPage(chatName:'Nada Nasser',),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
          icons: [
            // CupertinoIcons.home,
            // CupertinoIcons.heart,
            // CupertinoIcons.cart,
            // CupertinoIcons.person,
            Icons.home_outlined,
            Icons.favorite_border,
            Icons.chat,
            Icons.person,
            
          ],
          
          inactiveColor: Colors.grey,
          activeColor: Colors.redAccent[200],
          gapLocation: GapLocation.center, 
   
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          iconSize: 25,
          height: 50,
          activeIndex: pageIndex,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        );
  }
}
