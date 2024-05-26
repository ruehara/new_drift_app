import 'package:drift/drift.dart';
import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/src/core/theme/_theme.dart';
import '../database/connection/connection.dart';
import '../database/database.dart';
import '../../modules/counter/counter.dart';

final serviceLocator = GetIt.instance;

Future<void> loadServiceLocator() async {
  const String flavor = String.fromEnvironment('app_flavor');
  if (kDebugMode) {
    print(flavor);
  }
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  serviceLocator
      .registerSingleton<AppSharedPreferences>(AppSharedPreferencesImpl());
  serviceLocator.registerLazySingleton<CounterCubit>(() => CounterCubit());
  serviceLocator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  serviceLocator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  serviceLocator
      .registerSingleton<Database>(Database(DatabaseConnection(connect())));
}
