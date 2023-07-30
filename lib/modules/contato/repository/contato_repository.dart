import 'package:new_app_drift/app/library.dart';
import 'package:new_app_drift/database/database.dart';
import '../model/contato_model.dart';

class ContatoRepository {
  List<ContatoModel>? getContatos() {
    final Database db = GetIt.instance<Database>();
    final maps = db.customSelect('select * from users');
    return List.empty();
    // return List.generate(maps., (i) {
    //   return ContatoModel(
    //     nome: maps[i]['nome'],
    //     contato: maps[i]['contato'],
    //     id: maps[i]['id'],
    //   );
    // });
  }
}
