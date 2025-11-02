import 'package:adweyaty_application/core/theme/app_color.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const CustomTextFormField({super.key, required this.hintText, this.isPassword=false,});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword && obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword? InkWell(
            onTap: (){
              setState(() {
                obscureText=!obscureText;
              });
            },
            child: Icon(obscureText?Icons.visibility_off:Icons.visibility)
        ) : null,
        hintText:  widget.hintText,
        hintStyle: AppTextStyle.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.boarderColor),
          borderRadius: BorderRadius.circular(8),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

    );
  }
}
