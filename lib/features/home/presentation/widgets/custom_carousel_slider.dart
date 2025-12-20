import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/theme/app_color.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  static const List<String> sliders = [
    AppImages.carro1,
    AppImages.carro2,
    AppImages.carro3,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset(
                  sliders[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: 190,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInToLinear,
                enlargeCenterPage: true,
                enlargeFactor: 0.6,
                onPageChanged: (index,reason){
                  setState(() {
                    _currentIndex=index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(height: 8.h),

          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(sliders.length, (index) {
              final isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 12.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColor.primaryColor
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
