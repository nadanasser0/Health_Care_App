
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/log_in/view/login_view.dart';
import 'package:health_care_app/core/constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
   
    super.initState();
     Timer( Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen())));
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spalshBackGroundColor,

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Image.asset("lib/images/Group.png"),
            // const SizedBox(height: 20),
            Text(
              "HealthCare",
              style: TextStyle(
                fontSize: 28,
                 color: AppColors.textColor,
                fontWeight: FontWeight.bold,
    
              ),
            ),
            SizedBox(height: 5),
             Text(
              "Medical App",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      ),
    );
  }
}