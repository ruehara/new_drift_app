import 'package:drift/drift.dart';
import 'database.dart';
import 'accessor.drift.dart';

@DriftAccessor(
  include: {'src/user_queries.drift'},
  queries: {'addUser': r'INSERT INTO users $user;'},
)
class MyAccessor extends DatabaseAccessor<Database> with $MyAccessorMixin {
  MyAccessor(super.attachedDatabase);
}
