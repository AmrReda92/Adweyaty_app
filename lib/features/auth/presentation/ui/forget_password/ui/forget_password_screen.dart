import 'package:adweyaty_application/features/auth/presentation/ui/forget_password/cubit/reset_pass_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/validation_service.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/l10n.dart';
import '../cubit/reset_pass_state.dart';


class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ResetPassCubit, ResetPassState>(
          listener: (context, state) {
            if (state is ResetPassLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is ResetPassSuccess) {
              Navigator.pop(context); // close loader
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Reset link sent to your email"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context); // رجوع للـ Login
            }

            if (state is ResetPassError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppbar(),
                    SizedBox(height: 40.h),

                    /// Title
                    Text(
                      S.of(context).forgot,
                      style: AppTextStyle.font28,
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      "Enter your email and we'll send you a link to reset your password.",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.hintStyle,
                    ),

                    SizedBox(height: 40.h),

                    Form(
                      key: _formKey,
                      child: CustomTextFormField(
                        hintText: S.of(context).hintEmail,
                        controller: _emailController,
                        validator: ValidationService.validateEmail,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    CustomButton(
                      title: "Send Reset Link",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<ResetPassCubit>()
                              .resetPassword(_emailController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
