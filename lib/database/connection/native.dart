import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File> get databaseFile async {
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, 'todos.db');
  return File(dbPath);
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(
    Future(() async {
      return NativeDatabase.createBackgroundConnection(await databaseFile);
    }),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  database.schemaVersion;
}
