import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';



class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale("en"));
  
  void changeToEnglish(){
    emit(const Locale("en"));
  }

  void changeToArabic(){
    emit(const Locale("ar"));
  }
}
