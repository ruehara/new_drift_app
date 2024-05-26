part of 'language_cubit.dart';

class LanguageState {
  final Locale locale;
  LanguageState({required this.locale});

  @override
  String toString() => '$locale';
}

extension LanguageCubitX on BuildContext {
  LanguageCubit get language => serviceLocator<LanguageCubit>();
}
