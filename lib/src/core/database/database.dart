import 'package:drift/drift.dart';
import 'package:new_app_drift/src/core/database/accessor.dart';
import 'package:new_app_drift/src/core/database/tables/users.drift.dart';

import 'connection/connection.dart';
import 'database.drift.dart';

@DriftDatabase(
  include: {
    'tables/user_queries.drift',
    'tables/posts.drift',
    'tables/search.drift',
    'tables/teste.drift'
  },
  daos: [MyAccessor],
)
class Database extends $Database {
  Database(super.e);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: ((m, from, to) async {
        await customStatement('PRAGMA foreign_keys = OFF');
        for (var step = from + 1; step <= to; step++) {
          switch (step) {
            case 2:
              // column was added in version 2.
              await m.addColumn(teste, teste.teste2);
              break;
            case 3:
              // column was added in version 3.
              await m.addColumn(teste, teste.teste3);
              break;
            case 4:
              // column was added in version 4.
              await m.addColumn(teste, teste.teste4);
              break;
            case 5:
              // column was added in version 4.
              await m.addColumn(teste, teste.teste5);
              break;
          }
        }
      }),
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        if (details.wasCreated) {
          await batch((b) {
            b.insert(
              users,
              UsersCompanion.insert(name: 'Important'),
            );
          });
        }
        await validateDatabaseSchema(this);
      },
    );
  }
}
