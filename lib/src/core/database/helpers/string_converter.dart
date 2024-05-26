import 'package:drift/drift.dart';

class StringConverter extends TypeConverter<String, String> {
  final int size;
  const StringConverter(this.size);
  @override
  String fromSql(String fromDb) {
    return fromDb.length > size ? fromDb.substring(0, size) : fromDb;
  }

  @override
  String toSql(String value) {
    return value.length > size ? value.substring(0, size) : value;
  }
}
