import 'package:flutter/material.dart';
import 'package:new_app_drift/library.dart';
import '../../modules/counter/counter.dart';

abstract class AppSharedPreferences {
  Locale getLocale();
  int getCounter();
  ThemeMode getThemeMode();

  void setLocale(Locale locale);
  void setCounter(int counter);
  void setThemeMode(String theme);

  void clearAll();
  void removeCounter();
  void removeTheme();
  void removeLocale();
}

class AppSharedPreferencesImpl extends AppSharedPreferences {
  SharedPreferences get sharedPrefs => serviceLocator<SharedPreferences>();

  @override
  int getCounter() {
    return sharedPrefs.getInt(counterVar) ?? 0;
  }

  @override
  Locale getLocale() {
    return Locale(sharedPrefs.getString(localeVar) ?? 'pt');
  }

  @override
  ThemeMode getThemeMode() {
    return sharedPrefs.getString(themeVar) == 'dark'
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  @override
  void clearAll() {
    removeCounter();
    removeLocale();
    removeTheme();
  }

  @override
  void setCounter(int counter) {
    sharedPrefs.setInt(counterVar, counter);
  }

  @override
  void setLocale(Locale locale) {
    sharedPrefs.setString(localeVar, locale.languageCode);
  }

  @override
  void setThemeMode(String theme) {
    sharedPrefs.setString(themeVar, theme);
  }

  @override
  void removeCounter() {
    sharedPrefs.remove(counterVar);
    serviceLocator<CounterCubit>().setCounter(getCounter());
  }

  @override
  void removeLocale() {
    sharedPrefs.remove(localeVar);
    serviceLocator<LanguageCubit>().setLocale(getLocale());
  }

  @override
  void removeTheme() {
    sharedPrefs.remove(themeVar);
    serviceLocator<ThemeCubit>().setTheme(getThemeMode());
  }
}
