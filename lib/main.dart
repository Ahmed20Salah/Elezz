import 'package:elezz/model/app_model.dart';
import 'package:elezz/pages/description.dart';
import 'package:elezz/pages/home.dart';
import 'package:elezz/pages/login.dart';
import 'package:elezz/pages/register.dart';
import 'package:elezz/pages/splash.dart';
import 'package:elezz/pages/switch.dart';
import 'package:elezz/utils/app_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

void main() async {
  runApp(
    ScopedModel(
      model: AppModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, _, AppModel model) {
      return MaterialApp(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: model.appLocale,
        home: Splash(),
      );
    });
  }
}
