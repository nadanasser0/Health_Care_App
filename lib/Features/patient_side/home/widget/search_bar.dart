import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: AppColors.greyColor),
        prefixIcon: Icon(Icons.search, color: AppColors.blueColor),
        filled: true,
        fillColor: AppColors.greyLightColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        print("Searching for: $value");
      },
    );
  }
}
