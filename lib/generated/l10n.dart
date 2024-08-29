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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `ASKM`
  String get askm {
    return Intl.message(
      'ASKM',
      name: 'askm',
      desc: '',
      args: [],
    );
  }

  /// `Whether you're on the go or in the`
  String get whether {
    return Intl.message(
      'Whether you\'re on the go or in the',
      name: 'whether',
      desc: '',
      args: [],
    );
  }

  /// `comfort of your own space`
  String get comfort {
    return Intl.message(
      'comfort of your own space',
      name: 'comfort',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Continue with email`
  String get continue_with_email {
    return Intl.message(
      'Continue with email',
      name: 'continue_with_email',
      desc: '',
      args: [],
    );
  }

  /// `Whether you're on the go or in the comfort of your own space`
  String get whether_you_re_on_the_go_or_in_the_comfort_of_your_own_space {
    return Intl.message(
      'Whether you\'re on the go or in the comfort of your own space',
      name: 'whether_you_re_on_the_go_or_in_the_comfort_of_your_own_space',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ask anything`
  String get askAnything {
    return Intl.message(
      'Ask anything',
      name: 'askAnything',
      desc: '',
      args: [],
    );
  }

  /// `Write`
  String get write {
    return Intl.message(
      'Write',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `a plan how to learn trading`
  String get aPlanHowToLearnTrading {
    return Intl.message(
      'a plan how to learn trading',
      name: 'aPlanHowToLearnTrading',
      desc: '',
      args: [],
    );
  }

  /// `Tell me`
  String get tellMe {
    return Intl.message(
      'Tell me',
      name: 'tellMe',
      desc: '',
      args: [],
    );
  }

  /// `how to care home plant monstera`
  String get howToCareHomePlantMonstera {
    return Intl.message(
      'how to care home plant monstera',
      name: 'howToCareHomePlantMonstera',
      desc: '',
      args: [],
    );
  }

  /// `Help me pick`
  String get helpMePick {
    return Intl.message(
      'Help me pick',
      name: 'helpMePick',
      desc: '',
      args: [],
    );
  }

  /// `a birthday gift for my mom`
  String get aBirthdayGiftForMyMom {
    return Intl.message(
      'a birthday gift for my mom',
      name: 'aBirthdayGiftForMyMom',
      desc: '',
      args: [],
    );
  }

  /// `Recommend a dish`
  String get recommendADish {
    return Intl.message(
      'Recommend a dish',
      name: 'recommendADish',
      desc: '',
      args: [],
    );
  }

  /// `for romantic dinner`
  String get forRomanticDinner {
    return Intl.message(
      'for romantic dinner',
      name: 'forRomanticDinner',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message(
      'Answer',
      name: 'answer',
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
