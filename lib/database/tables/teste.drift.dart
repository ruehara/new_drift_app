// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:new_app_drift/database/tables/teste.drift.dart' as i1;

class Teste extends i0.Table with i0.TableInfo<Teste, i1.TesteData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Teste(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const i0.VerificationMeta _testeMeta =
      const i0.VerificationMeta('teste');
  late final i0.GeneratedColumn<String> teste = i0.GeneratedColumn<String>(
      'teste', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _teste2Meta =
      const i0.VerificationMeta('teste2');
  late final i0.GeneratedColumn<String> teste2 = i0.GeneratedColumn<String>(
      'teste2', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _teste3Meta =
      const i0.VerificationMeta('teste3');
  late final i0.GeneratedColumn<String> teste3 = i0.GeneratedColumn<String>(
      'teste3', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _teste4Meta =
      const i0.VerificationMeta('teste4');
  late final i0.GeneratedColumn<String> teste4 = i0.GeneratedColumn<String>(
      'teste4', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _teste5Meta =
      const i0.VerificationMeta('teste5');
  late final i0.GeneratedColumn<String> teste5 = i0.GeneratedColumn<String>(
      'teste5', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _contentMeta =
      const i0.VerificationMeta('content');
  late final i0.GeneratedColumn<String> content = i0.GeneratedColumn<String>(
      'content', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, teste, teste2, teste3, teste4, teste5, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teste';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.TesteData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('teste')) {
      context.handle(
          _testeMeta, teste.isAcceptableOrUnknown(data['teste']!, _testeMeta));
    }
    if (data.containsKey('teste2')) {
      context.handle(_teste2Meta,
          teste2.isAcceptableOrUnknown(data['teste2']!, _teste2Meta));
    }
    if (data.containsKey('teste3')) {
      context.handle(_teste3Meta,
          teste3.isAcceptableOrUnknown(data['teste3']!, _teste3Meta));
    }
    if (data.containsKey('teste4')) {
      context.handle(_teste4Meta,
          teste4.isAcceptableOrUnknown(data['teste4']!, _teste4Meta));
    }
    if (data.containsKey('teste5')) {
      context.handle(_teste5Meta,
          teste5.isAcceptableOrUnknown(data['teste5']!, _teste5Meta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.TesteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.TesteData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      teste: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}teste']),
      teste2: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}teste2']),
      teste3: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}teste3']),
      teste4: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}teste4']),
      teste5: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}teste5']),
      content: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}content']),
    );
  }

  @override
  Teste createAlias(String alias) {
    return Teste(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TesteData extends i0.DataClass implements i0.Insertable<i1.TesteData> {
  final int id;
  final String? teste;
  final String? teste2;
  final String? teste3;
  final String? teste4;
  final String? teste5;
  final String? content;
  const TesteData(
      {required this.id,
      this.teste,
      this.teste2,
      this.teste3,
      this.teste4,
      this.teste5,
      this.content});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || teste != null) {
      map['teste'] = i0.Variable<String>(teste);
    }
    if (!nullToAbsent || teste2 != null) {
      map['teste2'] = i0.Variable<String>(teste2);
    }
    if (!nullToAbsent || teste3 != null) {
      map['teste3'] = i0.Variable<String>(teste3);
    }
    if (!nullToAbsent || teste4 != null) {
      map['teste4'] = i0.Variable<String>(teste4);
    }
    if (!nullToAbsent || teste5 != null) {
      map['teste5'] = i0.Variable<String>(teste5);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = i0.Variable<String>(content);
    }
    return map;
  }

  i1.TesteCompanion toCompanion(bool nullToAbsent) {
    return i1.TesteCompanion(
      id: i0.Value(id),
      teste: teste == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(teste),
      teste2: teste2 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(teste2),
      teste3: teste3 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(teste3),
      teste4: teste4 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(teste4),
      teste5: teste5 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(teste5),
      content: content == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(content),
    );
  }

  factory TesteData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return TesteData(
      id: serializer.fromJson<int>(json['id']),
      teste: serializer.fromJson<String?>(json['teste']),
      teste2: serializer.fromJson<String?>(json['teste2']),
      teste3: serializer.fromJson<String?>(json['teste3']),
      teste4: serializer.fromJson<String?>(json['teste4']),
      teste5: serializer.fromJson<String?>(json['teste5']),
      content: serializer.fromJson<String?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teste': serializer.toJson<String?>(teste),
      'teste2': serializer.toJson<String?>(teste2),
      'teste3': serializer.toJson<String?>(teste3),
      'teste4': serializer.toJson<String?>(teste4),
      'teste5': serializer.toJson<String?>(teste5),
      'content': serializer.toJson<String?>(content),
    };
  }

  i1.TesteData copyWith(
          {int? id,
          i0.Value<String?> teste = const i0.Value.absent(),
          i0.Value<String?> teste2 = const i0.Value.absent(),
          i0.Value<String?> teste3 = const i0.Value.absent(),
          i0.Value<String?> teste4 = const i0.Value.absent(),
          i0.Value<String?> teste5 = const i0.Value.absent(),
          i0.Value<String?> content = const i0.Value.absent()}) =>
      i1.TesteData(
        id: id ?? this.id,
        teste: teste.present ? teste.value : this.teste,
        teste2: teste2.present ? teste2.value : this.teste2,
        teste3: teste3.present ? teste3.value : this.teste3,
        teste4: teste4.present ? teste4.value : this.teste4,
        teste5: teste5.present ? teste5.value : this.teste5,
        content: content.present ? content.value : this.content,
      );
  @override
  String toString() {
    return (StringBuffer('TesteData(')
          ..write('id: $id, ')
          ..write('teste: $teste, ')
          ..write('teste2: $teste2, ')
          ..write('teste3: $teste3, ')
          ..write('teste4: $teste4, ')
          ..write('teste5: $teste5, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, teste, teste2, teste3, teste4, teste5, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.TesteData &&
          other.id == this.id &&
          other.teste == this.teste &&
          other.teste2 == this.teste2 &&
          other.teste3 == this.teste3 &&
          other.teste4 == this.teste4 &&
          other.teste5 == this.teste5 &&
          other.content == this.content);
}

class TesteCompanion extends i0.UpdateCompanion<i1.TesteData> {
  final i0.Value<int> id;
  final i0.Value<String?> teste;
  final i0.Value<String?> teste2;
  final i0.Value<String?> teste3;
  final i0.Value<String?> teste4;
  final i0.Value<String?> teste5;
  final i0.Value<String?> content;
  const TesteCompanion({
    this.id = const i0.Value.absent(),
    this.teste = const i0.Value.absent(),
    this.teste2 = const i0.Value.absent(),
    this.teste3 = const i0.Value.absent(),
    this.teste4 = const i0.Value.absent(),
    this.teste5 = const i0.Value.absent(),
    this.content = const i0.Value.absent(),
  });
  TesteCompanion.insert({
    this.id = const i0.Value.absent(),
    this.teste = const i0.Value.absent(),
    this.teste2 = const i0.Value.absent(),
    this.teste3 = const i0.Value.absent(),
    this.teste4 = const i0.Value.absent(),
    this.teste5 = const i0.Value.absent(),
    this.content = const i0.Value.absent(),
  });
  static i0.Insertable<i1.TesteData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? teste,
    i0.Expression<String>? teste2,
    i0.Expression<String>? teste3,
    i0.Expression<String>? teste4,
    i0.Expression<String>? teste5,
    i0.Expression<String>? content,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (teste != null) 'teste': teste,
      if (teste2 != null) 'teste2': teste2,
      if (teste3 != null) 'teste3': teste3,
      if (teste4 != null) 'teste4': teste4,
      if (teste5 != null) 'teste5': teste5,
      if (content != null) 'content': content,
    });
  }

  i1.TesteCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? teste,
      i0.Value<String?>? teste2,
      i0.Value<String?>? teste3,
      i0.Value<String?>? teste4,
      i0.Value<String?>? teste5,
      i0.Value<String?>? content}) {
    return i1.TesteCompanion(
      id: id ?? this.id,
      teste: teste ?? this.teste,
      teste2: teste2 ?? this.teste2,
      teste3: teste3 ?? this.teste3,
      teste4: teste4 ?? this.teste4,
      teste5: teste5 ?? this.teste5,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (teste.present) {
      map['teste'] = i0.Variable<String>(teste.value);
    }
    if (teste2.present) {
      map['teste2'] = i0.Variable<String>(teste2.value);
    }
    if (teste3.present) {
      map['teste3'] = i0.Variable<String>(teste3.value);
    }
    if (teste4.present) {
      map['teste4'] = i0.Variable<String>(teste4.value);
    }
    if (teste5.present) {
      map['teste5'] = i0.Variable<String>(teste5.value);
    }
    if (content.present) {
      map['content'] = i0.Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TesteCompanion(')
          ..write('id: $id, ')
          ..write('teste: $teste, ')
          ..write('teste2: $teste2, ')
          ..write('teste3: $teste3, ')
          ..write('teste4: $teste4, ')
          ..write('teste5: $teste5, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}
