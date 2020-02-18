import 'package:elezz/utils/ar.dart';
import 'package:elezz/utils/en.dart';
import 'package:flutter/material.dart';

class DemoLocalization {
  DemoLocalization(this.locale);
  Locale locale;

  static DemoLocalization of(BuildContext context) =>
      Localizations.of<DemoLocalization>(context, DemoLocalization);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': EN.english,
    'ar': AR.arabic
  };

  Map<String , String>  get word{
    return _localizedValues[locale.languageCode];
  }
}
