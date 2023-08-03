import 'package:new_app_drift/app/library.dart';
import 'package:new_app_drift/database/database.dart';
import '../model/contato_model.dart';

class ContatoRepository {
  Future<List<ContatoModel>?> getContatos() async {
    final Database db = GetIt.instance<Database>();

    return db.customSelect('select id, name from users').get().then((rows) {
      return rows
          .map((row) => ContatoModel(
              id: row.read<int>('id'), name: row.read<String>('name')))
          .toList();
    });
  }
}
