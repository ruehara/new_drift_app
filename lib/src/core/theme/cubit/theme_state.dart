part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  @override
  String toString() => '$themeMode';
}

extension CounterCubitX on BuildContext {
  ThemeCubit get theme => serviceLocator<ThemeCubit>();
}
