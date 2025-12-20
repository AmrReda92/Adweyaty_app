import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/theme/app_color.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});




  static const List<String> sliders = [
    AppImages.carro1,
    AppImages.carro2,
    AppImages.carro3,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliders.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          width: double.infinity,
          sliders[index],
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
        height: 170.h,
        viewportFraction: 0.8,
        autoPlayCurve: Curves.linear,
        aspectRatio: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(seconds: 4),
        enlargeCenterPage: true

      ),
    );
  }

}
