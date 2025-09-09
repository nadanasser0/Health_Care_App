import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                   Text("skip", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp, size: 16,))
                   ,
                    // SizedBox(width: 20,),
            ],),
            
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 1);
                });
              },
              children: [
                buildPage(
                  image: "lib/images/doctor_female 1.png",
                  text: "Find a lot of specialist doctors in one place",
                ),
                buildPage(
                  image: "lib/images/doctor_man 1.png",
                  text: "Get advice only from a doctor you believe in.",
                ),
              ],
            ),
        
            // Spacer(),
            Positioned(
              left: 30,
              right: 30,
              bottom: 20,
        
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: ExpandingDotsEffect(
                      dotHeight: 5,
                      dotWidth: 5,
                      radius: 4,
                      spacing: 1,
                      dotColor: AppColors.greyColor.withOpacity(0.3),
                      activeDotColor: AppColors.blueColor,
                    ),
                  ),
        
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      backgroundColor: AppColors.blueColor,
                    ),
                    onPressed: () {
                      if (isLastPage) {
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.whiteColor,
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

  Widget buildPage({required String image, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 80.0,right: 80, bottom: 30 ,top: 70),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
