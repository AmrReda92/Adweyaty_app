import 'l10n.dart';

extension STranslate on S {
  String translate(String key) {
    switch (key) {
      case 'pressure':
        return pressure;
      case 'cough':
        return cough;
      case 'headache':
        return headache;
      case 'temperature':
        return temperature;
      case 'woman':
        return woman;
      case 'vitamin':
        return vitamin;
      case 'kids':
        return kids;
      case 'textOnboardingOne':
        return textOnboardingOne;
      case 'textOnboardingTwo':
        return textOnboardingTwo;
      case 'textOnboardingThree':
        return textOnboardingThree;
      default:
        return key; // يرجع المفتاح كما هو لو لم يجد ترجمة
    }
  }
}