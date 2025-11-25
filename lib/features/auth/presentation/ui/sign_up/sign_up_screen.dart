import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_show_dialogue.dart';
import 'package:adweyaty_application/core/widgets/custom_text_form_field.dart';
import 'package:adweyaty_application/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
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
              children: [
                CustomAppbar(),
                SizedBox(height: 30.h,),
                Image.asset(AppImages.user, width: 80.w, height: 80.h,),
                SizedBox(height: 40.h,),
                Text(S.of(context).signUpText, style: AppTextStyle.font28),
                SizedBox(height: 40.h,),
                CustomTextFormField(hintText: S.of(context).hintName,controller: nameController,),
                SizedBox(height: 20.h,),
                CustomTextFormField(hintText: S.of(context).hintMobile,controller: mobileController,),
                SizedBox(height: 20.h,),
                CustomTextFormField(hintText: S.of(context).hintEmail,controller: emailController,),
                SizedBox(height: 20.h,),
                CustomTextFormField(hintText: S.of(context).hintPassword, isPassword: true,controller: passwordController,),
                SizedBox(height: 50.h,),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                   if(state is AuthLoading){
                    customShowLoadingDialog(context);
                   }else if(state is AuthSuccess){
                     Navigator.pushNamedAndRemoveUntil(
                         context, Routes.validationScreen, (e) => false);
                   }else if (state is AuthError){
                     Navigator.pop(context);
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text(state.message)));
                   }
                  },
                  child: InkWell(
                      onTap: () {
                        context.read<AuthCubit>().createUserWithEmailAndPassword(emailAddress: emailController.text, password: passwordController.text) ;
                      },
                      child: CustomButton(title: S.of(context).register)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
