import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.blue[100],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                            
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                      ),
                      onPressed: onPressed, 
                      child: Text(
                        label,
                    style: TextStyle(
                     color: AppColors.blackColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),),),
                  );
  }
}