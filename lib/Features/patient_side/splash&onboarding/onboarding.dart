import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/strings.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 2);
                });
              },
              children: [
                  buildPage(
                  image: Strings.imageMaleDoctor2,
                  textHeader: Strings.textOnBoardingMaleDoctor2Header,
                  text: Strings.textOnBoardingMaleDoctor2,
                ),
                buildPage(
                  image: Strings.imageMaleDoctor,
                  textHeader: Strings.textOnBoardingMaleDoctorHeader,
                  text: Strings.textOnBoardingMaleDoctor,
                ),
                buildPage(
                  image: Strings.imageFemaleDoctor,
                  textHeader: Strings.textOnBoardingFemaleDoctorHeader,
                  text: Strings.textOnBoardingFemaleDoctor,
                ),
              
              ],
            ),
        
            Positioned(
              right: 5,
              top: 10,
        
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.loginOrSignup,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "skip",
                      style: TextStyle(color: AppColors.darkGreyColor.withOpacity(0.9), fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                      color: AppColors.darkGreyColor.withOpacity(0.9),
                    ),
                  ],
                ),
              ),
            ),
        
            // Spacer(),
            Positioned(
              left: 30,
              right: 30,
              bottom: 30,
        
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 7,
        
                      radius: 3.5,
                      spacing: 1,
                      dotColor: AppColors.greyColor.withOpacity(0.3),
                      activeDotColor: AppColors.blueColor,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        backgroundColor: AppColors.blueColor,
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginOrSignup,
                          );
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                        ),
                      ),
        
                      // Icon(
                      //   Icons.arrow_forward_ios_sharp,
                      //   color: AppColors.whiteColor,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({required String image,required String textHeader ,required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30,
            bottom: 30,
            top: 10,
          ),
          child: Column(
            children: [
              Text(
                textHeader,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 15),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
