import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/presentation/ui/sign_up_login/sign_up_login_screen.dart';
import '../app_images/app_images.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpLoginScreen()));
        },
            icon: Icon(Icons.arrow_back,size: 28.sp,)),
        Image.asset(AppImages.logo),
        Opacity(
          opacity: 0,
          child: Icon(Icons.arrow_back, size: 28.sp),
        ),

      ],
    );
  }
}
