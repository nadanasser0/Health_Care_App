import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:health_care_app/Features/calender/calender_screen.dart';
import 'package:health_care_app/Features/home/home.dart';
import 'package:health_care_app/Features/profile/profile_screen.dart';


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
    
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
          icons: [
            // CupertinoIcons.home,
            // CupertinoIcons.heart,
            // CupertinoIcons.cart,
            // CupertinoIcons.person,
            Icons.home_outlined,
            Icons.shopping_cart_outlined,
            Icons.favorite_border,
            Icons.person,
            
          ],
          inactiveColor: Colors.grey,
          activeColor: Colors.redAccent[200],
          gapLocation: GapLocation.center, 
   
          // leftCornerRadius: 20,
          // rightCornerRadius: 20,
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
