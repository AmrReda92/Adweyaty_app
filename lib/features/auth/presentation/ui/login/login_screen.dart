import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_show_dialogue.dart';
import 'package:adweyaty_application/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: S.of(context).hintPassword,
                  isPassword: true,
                  controller: passwordController,
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
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is AuthLoading){
                      customShowLoadingDialog(context);
                    }else if(state is AuthSuccess){
                      Navigator.pushNamedAndRemoveUntil(context, Routes.bottomNavBarScreen, (e)=>false);
                    }else if(state is AuthError){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: InkWell(
                    onTap: (){
                      context.read<AuthCubit>().signInWithEmailAndPassword(emailAddress: emailController.text, password: passwordController.text);

                    },
                      child: CustomButton(title: S.of(context).login)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
