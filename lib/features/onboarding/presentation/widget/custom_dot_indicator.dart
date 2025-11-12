import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomDotIndicator extends StatelessWidget {
  final int activeIndex ;
  const CustomDotIndicator({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex ,
      count: 3,
      effect: WormEffect(
          dotHeight: 10,
          dotWidth: 30,
          activeDotColor: Colors.blue
      ),
    );
  }
}
