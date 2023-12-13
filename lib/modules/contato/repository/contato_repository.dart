import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/database/database.dart';
import 'package:new_app_drift/database/tables/users.drift.dart';

class ContatoRepository {
  final Database db = GetIt.instance<Database>();
  Future<List<User>?> getContatos() async {
    return await db
        .customSelect('select id, name from users')
        .get()
        .then((rows) {
      return rows
          .map((row) => User(
                id: row.read<int>('id'),
                name: row.read<String>('name'),
              ))
          .toList();
    });
  }

  Future<List<User>?> getStreamContatos() async {
    return await db
        .customSelect('select id, name from users')
        .get()
        .then((rows) {
      return rows
          .map((row) => User(
                id: row.read<int>('id'),
                name: row.read<String>('name'),
              ))
          .toList();
    });
  }

  Stream<List<User>?> contentWithLongTitles() {
    return db.select(db.users).map((row) => row).watch();
  }

  Stream<List<User>?> teste() {
    return db
        .customSelect('select id, name from users')
        .map((row) => User(
              id: row.read<int>('id'),
              name: row.read<String>('name'),
            ))
        .watch();
  }

  Stream<List<User>?> teste2() {
    return db.customSelect('select id, name from users').watch().map((rows) {
      return rows.map((row) {
        return User(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
        );
      }).toList();
    });
  }
}
