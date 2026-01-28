import 'package:adweyaty_application/core/helper/validation_service.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_show_dialogue.dart';
import 'package:adweyaty_application/features/auth/data/models/login_model.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/login/cubit/login_cubit.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/app_images/app_images.dart';
import '../../../../../../core/helper/local_storage_service.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current is! LoginError,
      listener: (context, state) async {
        if (state is LoginLoading) {
          customShowLoadingDialog(context);
        } else if (state is LoginSuccess) {
          await LocalStorageService.saveLogin(state.user.uid);
          context.read<HomeCubit>().loadUserData(state.user);
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.bottomNavBarScreen,
                (e) => false,
          );
        } else if (state is LoginError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomAppbar(),
                      SizedBox(height: 30.h),

                      /// Animated User Icon
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: -60, end: 0),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, value),
                            child: Opacity(
                              opacity:
                              (1 - (value.abs() / 60)).clamp(0.0, 1.0),
                              child: child,
                            ),
                          );
                        },
                        child: Image.asset(
                          AppImages.user,
                          width: 80.w,
                          height: 80.h,
                        ),
                      ),

                      SizedBox(height: 40.h),

                      /// Animated Title
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.8, end: 1),
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutBack,
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: Text(
                          S.of(context).signInText,
                          style: AppTextStyle.font28,
                        ),
                      ),

                      SizedBox(height: 66.h),

                      /// Animated Form Fields
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 80, end: 0),
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, value),
                            child: child,
                          );
                        },
                        child: Column(
                          children: [
                            CustomTextFormField(
                              focusNode: emailFocus,
                              textInputAction: TextInputAction.next,
                              hintText: S.of(context).hintEmail,
                              controller: emailController,
                              validator:
                              ValidationService.validateEmail,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(passwordFocus);
                              },
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              focusNode: passwordFocus,
                              textInputAction: TextInputAction.done,
                              hintText: S.of(context).hintPassword,
                              isPassword: true,
                              controller: passwordController,
                              validator:
                              ValidationService.validatePassword,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                                },
                                child: Text(
                                  S.of(context).forgot,
                                  style: AppTextStyle.hintStyle,
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<LoginCubit>()
                                      .signInWithEmailAndPassword(
                                    model: LoginModel(
                                      email: emailController.text,
                                      password:
                                      passwordController.text,
                                    ),
                                  );
                                }
                              },
                              child: CustomButton(
                                title: S.of(context).login,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
