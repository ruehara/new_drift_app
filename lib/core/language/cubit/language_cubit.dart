import 'package:flutter/material.dart';
import 'package:new_app_drift/app/library.dart';
import 'languages.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(LanguageState(
            locale: serviceLocator<AppSharedPreferences>().getLocale()));

  void updateAppLocale() async {
    serviceLocator<AppSharedPreferences>().getLocale() == AppLanguage.portuguese
        ? setLocale(AppLanguage.english)
        : setLocale(AppLanguage.portuguese);
  }

  void setLocale(Locale locale) async {
    serviceLocator<AppSharedPreferences>().setLocale(
        locale == AppLanguage.portuguese
            ? AppLanguage.portuguese
            : AppLanguage.english);
    emit(LanguageState(
        locale: locale == AppLanguage.portuguese
            ? AppLanguage.portuguese
            : AppLanguage.english));
  }
}
