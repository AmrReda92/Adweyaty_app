
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'adweyaty.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(Adweyaty());
}