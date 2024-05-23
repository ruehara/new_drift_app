import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/src/database/database.dart';
import 'package:new_app_drift/src/database/tables/users.drift.dart';
import 'dart:math';

class ContatoRepository {
  final Database db = GetIt.instance<Database>();
  Future<List<User>?> getContatos() async {
    return await db.select(db.users).get();
  }

  Stream<List<User>?> getStreamContatos() {
    return db.select(db.users).watch();
  }

  Future<void> addContato(User user) async {
    await db.into(db.users).insert(user);
  }

  Future<void> addContato2() async {
    var id = Random().nextInt(9999);
    User user = User(id: id, name: 'teste$id');
    await db.into(db.users).insert(user);
  }

  Future<void> updateContato(User user) async {
    await db.update(db.users).replace(user);
  }

  Future<void> deleteContato(User user) async {
    await db.delete(db.users).delete(user);
  }

  Future<void> deleteAllContatos() async {
    await db.delete(db.users).go();
  }
}
