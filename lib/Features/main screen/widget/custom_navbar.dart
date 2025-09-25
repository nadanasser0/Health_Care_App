import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: 26.0,
              color: isSelected
                  ? (item.activeColorSecondary ?? item.activeColorPrimary)
                  : (item.inactiveColorPrimary ?? item.activeColorPrimary),
            ),
            child: item.icon,
          ),
          const SizedBox(height: 5),
          Text(
            item.title ?? "",
            style: TextStyle(
              color: isSelected
                  ? (item.activeColorSecondary ?? item.activeColorPrimary)
                  : item.inactiveColorPrimary,
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: _buildItem(item, selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}
