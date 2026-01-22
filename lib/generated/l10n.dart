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

  /// `Welcome user`
  String get welcomeUser {
    return Intl.message(
      'Welcome user',
      name: 'welcomeUser',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeOnly {
    return Intl.message('Welcome', name: 'welcomeOnly', desc: '', args: []);
  }

  /// `Search for.....`
  String get searchFor {
    return Intl.message(
      'Search for.....',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `pressure medicines`
  String get pressure {
    return Intl.message(
      'pressure medicines',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `cough medicines`
  String get cough {
    return Intl.message('cough medicines', name: 'cough', desc: '', args: []);
  }

  /// `headache medicines`
  String get headache {
    return Intl.message(
      'headache medicines',
      name: 'headache',
      desc: '',
      args: [],
    );
  }

  /// `kids medicines`
  String get kids {
    return Intl.message('kids medicines', name: 'kids', desc: '', args: []);
  }

  /// `temperature medicines`
  String get temperature {
    return Intl.message(
      'temperature medicines',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `woman products`
  String get woman {
    return Intl.message('woman products', name: 'woman', desc: '', args: []);
  }

  /// `vitamin medicines`
  String get vitamin {
    return Intl.message(
      'vitamin medicines',
      name: 'vitamin',
      desc: '',
      args: [],
    );
  }

  /// `Send your Prescription`
  String get Prescription {
    return Intl.message(
      'Send your Prescription',
      name: 'Prescription',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get categories {
    return Intl.message('categories', name: 'categories', desc: '', args: []);
  }

  /// `Show All`
  String get showAll {
    return Intl.message('Show All', name: 'showAll', desc: '', args: []);
  }

  /// `Home`
  String get homeNavBar {
    return Intl.message('Home', name: 'homeNavBar', desc: '', args: []);
  }

  /// `Cart`
  String get cartNavBar {
    return Intl.message('Cart', name: 'cartNavBar', desc: '', args: []);
  }

  /// `Favourite`
  String get favouriteNavBar {
    return Intl.message(
      'Favourite',
      name: 'favouriteNavBar',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileNavBar {
    return Intl.message('Profile', name: 'profileNavBar', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Support & Help`
  String get supportAndHelp {
    return Intl.message(
      'Support & Help',
      name: 'supportAndHelp',
      desc: '',
      args: [],
    );
  }

  /// `Policy & Privacy`
  String get PolicyAndPrivacy {
    return Intl.message(
      'Policy & Privacy',
      name: 'PolicyAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message('language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get ar {
    return Intl.message('Arabic', name: 'ar', desc: '', args: []);
  }

  /// `English`
  String get en {
    return Intl.message('English', name: 'en', desc: '', args: []);
  }

  /// `My Favourite`
  String get myFavourite {
    return Intl.message(
      'My Favourite',
      name: 'myFavourite',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message('My Cart', name: 'myCart', desc: '', args: []);
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message('My Profile', name: 'myProfile', desc: '', args: []);
  }

  /// `No favourites yet`
  String get noFavouritesYet {
    return Intl.message(
      'No favourites yet',
      name: 'noFavouritesYet',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is Empty`
  String get yourCartEmpty {
    return Intl.message(
      'Your Cart is Empty',
      name: 'yourCartEmpty',
      desc: '',
      args: [],
    );
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
