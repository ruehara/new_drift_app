import 'package:flutter/material.dart';

import '../../../library.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeMode: serviceLocator<AppSharedPreferences>().getThemeMode()));

  void updateAppTheme() async {
    serviceLocator<AppSharedPreferences>().getThemeMode() == ThemeMode.light
        ? setTheme(ThemeMode.dark)
        : setTheme(ThemeMode.light);
  }

  void setTheme(ThemeMode themeMode) async {
    serviceLocator<AppSharedPreferences>()
        .setThemeMode(themeMode == ThemeMode.light ? 'light' : 'dark');
    emit(ThemeState(
        themeMode:
            themeMode == ThemeMode.light ? ThemeMode.light : ThemeMode.dark));
  }
}
