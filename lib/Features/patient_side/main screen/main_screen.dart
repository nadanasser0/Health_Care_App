import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/chats/view/chat_details_screen.dart';
import 'package:health_care_app/Features/patient_side/chats/view/chats_list_screen.dart';
import 'package:health_care_app/Features/patient_side/calender/calender_screen.dart';
import 'package:health_care_app/Features/patient_side/home/home.dart';
import 'package:health_care_app/Features/patient_side/inbox/inbox_screen.dart';
import 'package:health_care_app/Features/patient_side/profile/profile_screen.dart';
import 'package:health_care_app/Features/patient_side/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:badges/badges.dart' as badges;

// استورد شاشاتك
// import 'home.dart';
// import 'search_screen.dart';
// import 'inbox_screen.dart';
// import 'calender_screen.dart';
// import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }


  /// الشاشات
  List<Widget> _buildScreens() {
    return const [
    HomeScreen(),
    ChatsListScreen(),
    // ChatPage(chatName:'Rania Mohamed',),
      // InboxScreen(),
    SearchScreen(),
    CalenderScreen(),
    ProfileScreen(),
    ];
  }

  /// الايقونات + البار
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      /// Home
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),

      /// Inbox مع بادج
      PersistentBottomNavBarItem(
        icon: badges.Badge(
          showBadge: true,
          badgeContent: const Text(
            "3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(6),
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -12),
          child: const Icon(Icons.chat_bubble_outline),
        ),
        title: "Inbox",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),

      /// Search (في النص ومميز)
      PersistentBottomNavBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.search, color: Colors.white, size: 28),
        ),
        title: "Search",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),

      /// Calendar
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: "Calendar",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),

      /// Profile (بأفاتار)
      PersistentBottomNavBarItem(
        icon: const CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(
            "https://randomuser.me/api/portraits/men/46.jpg",
          ),
        ),
        title: "Profile",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style15,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      navBarHeight: 80, // طول البار
    );
  }
}
