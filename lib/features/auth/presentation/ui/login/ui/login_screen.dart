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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous,current)=>(current is! LoginError),
  listener: (context, state) {

    if(state is LoginLoading){
      customShowLoadingDialog(context);
    }

    else if(state is LoginSuccess){
      context.read<HomeCubit>().loadUserData(state.user);
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, Routes.bottomNavBarScreen,arguments: state.user, (e)=>false);
    }

    else if(state is LoginError){
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
                  CustomAppbar(),
                  SizedBox(height: 30.h),
                  Image.asset(AppImages.user, width: 80.w, height: 80.h),
                  SizedBox(height: 40.h),
                  Text(S.of(context).signInText, style: AppTextStyle.font28),
                  SizedBox(height: 66.h),
                  CustomTextFormField(
                    hintText: S.of(context).hintEmail,
                    controller: emailController,
                    validator: ValidationService.validateEmail
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    hintText: S.of(context).hintPassword,
                    isPassword: true,
                    controller: passwordController,
                    validator: ValidationService.validatePassword
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).forgot,
                      style: AppTextStyle.hintStyle,
                    ),
                  ),
                  SizedBox(height: 40.h),
                 InkWell(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          context.read<LoginCubit>().signInWithEmailAndPassword(
                              model: LoginModel(email: emailController.text, password: passwordController.text)
                          );
                        }

                      },
                        child: CustomButton(title: S.of(context).login)),

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
