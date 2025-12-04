import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_show_dialogue.dart';
import 'package:adweyaty_application/core/widgets/custom_text_form_field.dart';
import 'package:adweyaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:adweyaty_application/features/auth/presentation/ui/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/validation_service.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>() ;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    return BlocConsumer<SignUpCubit, SignUpState>(
      buildWhen: (previous,current)=>(current is! SignUpError),

      listener: (context, state) {

    if(state is SignUpLoading){
      customShowLoadingDialog(context);

    }else if(state is SignUpSuccess){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, Routes.validationScreen);

    }else if(state is SignUpError){
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
                children: [
                  CustomAppbar(),
                  SizedBox(height: 30.h,),
                  Image.asset(AppImages.user, width: 80.w, height: 80.h,),
                  SizedBox(height: 40.h,),
                  Text(S.of(context).signUpText, style: AppTextStyle.font28),
                  SizedBox(height: 40.h,),
                  CustomTextFormField(
                    hintText: S.of(context).hintName,
                    controller: nameController,
                    validator: ValidationService.validateName

                  ),
                  SizedBox(height: 20.h,),

                  CustomTextFormField(
                    hintText: S.of(context).hintMobile,
                    controller: mobileController,
                    validator: ValidationService.validatePhoneNumber
                  ),
                  SizedBox(height: 20.h,),

                  CustomTextFormField(
                    hintText: S.of(context).hintEmail,
                    controller: emailController,
                    validator: ValidationService.validateEmail
                  ),
                  SizedBox(height: 20.h,),

                  CustomTextFormField(
                    hintText: S.of(context).hintPassword,
                    isPassword: true,controller: passwordController,
                    validator: ValidationService.validatePassword
                  ),
                  SizedBox(height: 50.h,),

                  InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            context.read<SignUpCubit>().createUserWithEmailAndPassword(
                                model: SignUpModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: mobileController.text
                                )
                            );

                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).allFieldsCorrectly),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }

                        },
                        child: CustomButton(title: S.of(context).register)),

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
