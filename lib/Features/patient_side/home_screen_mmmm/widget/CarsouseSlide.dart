//             CarsouseSlide
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class CarsouseSlide extends StatelessWidget {
  const CarsouseSlide({super.key, required this.imageView});

  final List<String> imageView;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageView.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.textColorBlue,
              width: 1.5, // سمك الإطار
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageView[itemIndex],
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 170,
        aspectRatio: 1,
        viewportFraction: 0.6,
        // initialPage: 0,
        // enableInfiniteScroll: true,
        // reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
