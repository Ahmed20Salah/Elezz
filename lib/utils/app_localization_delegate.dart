import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizationsDelegate extends LocalizationsDelegate<DemoLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) {
    return SynchronousFuture<DemoLocalization>(DemoLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
