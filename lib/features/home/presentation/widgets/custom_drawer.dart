import 'package:adweyaty_application/core/localization/language_cubit/language_cubit.dart';
import 'package:adweyaty_application/core/routes/routes.dart';
import 'package:adweyaty_application/features/home/presentation/widgets/custom_row_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade200,
      child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Column(
                children: [
                  Text("Adweyaty Application",
                    style: AppTextStyle.appBarTitle.copyWith(fontWeight: FontWeight.w700),),
                  Divider(
                    thickness: 1.h,
                    color: AppColor.outLineColor,
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),

              Column(
                spacing: 20.h,
                children: [
                  CustomRowDrawer(title: S.of(context).home,icon: Icons.home,),
                  CustomRowDrawer(title: S.of(context).settings,icon: Icons.settings,),
                  CustomRowDrawer(title: S.of(context).supportAndHelp,icon: Icons.help,),
                  CustomRowDrawer(title: S.of(context).PolicyAndPrivacy,icon: Icons.privacy_tip_sharp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRowDrawer(title: S.of(context).language,icon: Icons.language,),
                      ToggleSwitch(
                        minWidth: 50,
                        initialLabelIndex:context.watch<LanguageCubit>().state.languageCode == 'en' ? 0 : 1,
                        cornerRadius: 20.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: [S.of(context).en, S.of(context).ar],
                        activeBgColors: const [[Colors.blue],[Colors.blue]],
                        onToggle: (index) {
                          final langCubit = context.read<LanguageCubit>();
                          if(index==0){
                            langCubit.changeToEnglish();
                          }else{
                            langCubit.changeToArabic();
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
