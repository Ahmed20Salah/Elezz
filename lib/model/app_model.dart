import 'package:elezz/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  Locale _locale = Locale('en');
  Locale get appLocale => _locale;

  void changeLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
    print(locale.languageCode);
  }
}
