import 'dart:io';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button_profile.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:adweyaty_application/features/profile/data/cubit/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      context.read<ProfileCubit>().uploadProfileImage(
        image: File(pickedImage.path),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(
        title: S.of(context).myProfile,
        icon: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.signUpLoginScreen);
          },
          child: Icon(Icons.logout, size: 30.w),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileSuccess) {
                      // نخزن الصورة في HomeCubit علشان تفضل موجودة بعد الريستارت
                      context
                          .read<HomeCubit>()
                          .updateProfileImage(state.imageUrl);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: _uploadImage,
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, homeState) {
                          // لو عندنا صورة محفوظة في المستخدم
                          if (homeState is HomeDataSuccess &&
                              homeState.user.profileImageUrl != null) {
                            return CircleAvatar(
                              radius: 50.r,
                              backgroundImage:
                              CachedNetworkImageProvider(
                                homeState.user.profileImageUrl!,
                              ),
                            );
                          }

                          // أثناء الرفع
                          if (state is ProfileLoading) {
                            return SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: const CircularProgressIndicator(),
                            );
                          }

                          // الحالة الافتراضية
                          return CircleAvatar(
                            radius: 50.r,
                            child:
                            const Icon(Icons.camera_alt, size: 30),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(width: 20.w),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeDataSuccess) {
                      return Text(
                        state.user.name,
                        style: AppTextStyle.font20black,
                      );
                    }
                    return const Text("User");
                  },
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomButtonProfile(
              title: "My orders",
              iconProfileScreen: Icons.arrow_right,
            ),
            SizedBox(height: 14.h),
            CustomButtonProfile(
              title: "Edit Profile",
              iconProfileScreen: Icons.arrow_right,
            ),
            SizedBox(height: 14.h),
            CustomButtonProfile(
              title: "Reset Password",
              iconProfileScreen: Icons.arrow_right,
            ),
            SizedBox(height: 14.h),
            CustomButtonProfile(
              title: "Contact us",
              iconProfileScreen: Icons.arrow_right,
            ),
            SizedBox(height: 14.h),
            CustomButtonProfile(
              title: "Privacy & Terms",
              iconProfileScreen: Icons.arrow_right,
            ),
          ],
        ),
      ),
    );
  }
}
