import 'package:drift/drift.dart';
import 'accessor.dart';

import 'database.drift.dart';

@DriftDatabase(
  include: {
    'src/user_queries.drift',
    'src/posts.drift',
    'src/search.drift',
    'src/teste.drift'
  },
  daos: [MyAccessor],
)
class Database extends $Database {
  Database(super.e);

  @override
  int get schemaVersion => 3;

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
          }
        }
      }),
      beforeOpen: (details) async {
        if (details.wasCreated) {}
      },
    );
  }
}
