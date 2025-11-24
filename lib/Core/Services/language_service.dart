import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale? appLanguage;
  bool isLoaded = false;

  AppLanguageProvider() {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLang = prefs.getString('languageCode');

    if (savedLang != null) {
      appLanguage = Locale(savedLang);
    } else {
      final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
      appLanguage = Locale(deviceLocale.languageCode);
    }

    isLoaded = true; 
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', newLanguage);
    appLanguage = Locale(newLanguage);
    notifyListeners();
  }
}
