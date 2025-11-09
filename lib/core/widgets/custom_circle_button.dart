import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleButton extends StatelessWidget {
  final IconData? icon ;
  const CustomCircleButton({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20.sp,),
    );
  }
}
