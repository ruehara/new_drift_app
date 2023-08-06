import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/database/database.dart';
import 'package:new_app_drift/database/tables/users.drift.dart';

class ContatoRepository {
  Future<List<User>?> getContatos() async {
    final Database db = GetIt.instance<Database>();

    return await db.customSelect('select id, name from users').get().then(
      (rows) {
        return rows
            .map(
              (row) => User(
                id: row.read<int>('id'),
                name: row.read<String>('name'),
              ),
            )
            .toList();
      },
    );
  }
}
