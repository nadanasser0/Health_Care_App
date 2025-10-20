import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class ForgotpasswordButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedButton;
  final VoidCallback onPressedtext;

  const ForgotpasswordButton({
    super.key,
    required this.text, required this.onPressedButton, required this.onPressedtext,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueColor,
                foregroundColor: AppColors.whiteColor,

                padding: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: onPressedButton,

              // },
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Need help? Visit our"),
              GestureDetector(
                onTap: onPressedtext,
                child: Text(
                  " help center",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
