import 'package:elezz/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends Model {
  Locale _locale = Locale('en');
  Locale get appLocale => _locale;

  void changeLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (locale.languageCode == 'en') {
      preferences.setString('lang', 'en');
    } else {
      preferences.setString('lang', 'ar');
    }
    print(locale.languageCode);
  }

  Future<Locale> checkLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var re = preferences.getString('lang');

    if (re == 'ar') {
      changeLanguage(Locale('ar'));
      return Locale('ar');
    } else {
      changeLanguage(Locale('en'));

      return Locale('en');
    }
  }
}
