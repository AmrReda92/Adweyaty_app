// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ADWEYATY APP`
  String get splashText {
    return Intl.message('ADWEYATY APP', name: 'splashText', desc: '', args: []);
  }

  /// `Adweyaty is not just an app, it's your healthcare companion, putting the pharmacy at your fingertips. Adweyaty is here to simplify your healthcare journey.`
  String get textOnboardingOne {
    return Intl.message(
      'Adweyaty is not just an app, it\'s your healthcare companion, putting the pharmacy at your fingertips. Adweyaty is here to simplify your healthcare journey.',
      name: 'textOnboardingOne',
      desc: '',
      args: [],
    );
  }

  /// `Browse and discover Adweyaty's wide range of products for quick and effective discovery`
  String get textOnboardingTwo {
    return Intl.message(
      'Browse and discover Adweyaty\'s wide range of products for quick and effective discovery',
      name: 'textOnboardingTwo',
      desc: '',
      args: [],
    );
  }

  /// `Customer Support: Connect with our dedicated Adweyaty support team for quick and friendly assistance, and order easily and conveniently through our user-friendly interface.`
  String get textOnboardingThree {
    return Intl.message(
      'Customer Support: Connect with our dedicated Adweyaty support team for quick and friendly assistance, and order easily and conveniently through our user-friendly interface.',
      name: 'textOnboardingThree',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get titleOnBoardingOne {
    return Intl.message('Next', name: 'titleOnBoardingOne', desc: '', args: []);
  }

  /// `Next`
  String get titleOnBoardingTwo {
    return Intl.message('Next', name: 'titleOnBoardingTwo', desc: '', args: []);
  }

  /// `Start`
  String get titleOnBoardingThree {
    return Intl.message(
      'Start',
      name: 'titleOnBoardingThree',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Adweyaty`
  String get signUpLoginText {
    return Intl.message(
      'Welcome To Adweyaty',
      name: 'signUpLoginText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Sign in to your account`
  String get signInText {
    return Intl.message(
      'Sign in to your account',
      name: 'signInText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get hintEmail {
    return Intl.message('Email', name: 'hintEmail', desc: '', args: []);
  }

  /// `Password`
  String get hintPassword {
    return Intl.message('Password', name: 'hintPassword', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgot {
    return Intl.message('Forgot Password?', name: 'forgot', desc: '', args: []);
  }

  /// `password is not correct`
  String get passwordIsNotCorrect {
    return Intl.message(
      'password is not correct',
      name: 'passwordIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Register to your account`
  String get signUpText {
    return Intl.message(
      'Register to your account',
      name: 'signUpText',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get hintName {
    return Intl.message('Name', name: 'hintName', desc: '', args: []);
  }

  /// `Mobile`
  String get hintMobile {
    return Intl.message('Mobile', name: 'hintMobile', desc: '', args: []);
  }

  /// `Name is required!`
  String get nameIsRequired {
    return Intl.message(
      'Name is required!',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Mobile is not correct!`
  String get mobileIsNotCorrect {
    return Intl.message(
      'Mobile is not correct!',
      name: 'mobileIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Email is not correct`
  String get emailIsNotCorrect {
    return Intl.message(
      'Email is not correct',
      name: 'emailIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `password must be more than 6 char`
  String get passwordSixChar {
    return Intl.message(
      'password must be more than 6 char',
      name: 'passwordSixChar',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields correctly`
  String get allFieldsCorrectly {
    return Intl.message(
      'Please fill all fields correctly',
      name: 'allFieldsCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Account successfully created`
  String get accountSuccess {
    return Intl.message(
      'Account successfully created',
      name: 'accountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Adweyaty!`
  String get welcome {
    return Intl.message(
      'Welcome to Adweyaty!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
