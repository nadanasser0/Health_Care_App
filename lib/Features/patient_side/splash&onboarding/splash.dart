import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/splash&onboarding/onboarding.dart';
import 'package:health_care_app/core/constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(context,MaterialPageRoute(builder: (context)=> OnboardingView()) ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spalshBackGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 250),
            Image.asset("lib/images/Group.png"),
            const SizedBox(height: 10),

            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Text(
                  "Health Care",
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Spacer(),
            Text(
              "Medical App",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
              SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
