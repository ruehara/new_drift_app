import 'package:drift/drift.dart';
import 'package:new_app_drift/database/accessor.dart';

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
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: ((m, from, to) async {
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
          }
        }
      }),
      beforeOpen: (details) async {
        if (details.wasCreated) {}
      },
    );
  }
}
