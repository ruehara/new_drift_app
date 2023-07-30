// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:new_app_drift/database/tables/users.drift.dart' as i1;
import 'package:new_app_drift/database/tables/teste.drift.dart' as i2;
import 'package:new_app_drift/database/tables/posts.drift.dart' as i3;
import 'package:new_app_drift/database/tables/search.drift.dart' as i4;
import 'package:new_app_drift/database/tables/user_queries.drift.dart' as i5;
import 'package:new_app_drift/database/accessor.dart' as i6;
import 'package:new_app_drift/database/database.dart' as i7;
import 'package:drift/internal/modular.dart' as i8;

abstract class $Database extends i0.GeneratedDatabase {
  $Database(i0.QueryExecutor e) : super(e);
  late final i1.Users users = i1.Users(this);
  late final i2.Teste teste = i2.Teste(this);
  late final i1.Follows follows = i1.Follows(this);
  late final i1.PopularUsers popularUsers = i1.PopularUsers(this);
  late final i3.Posts posts = i3.Posts(this);
  late final i4.SearchInPosts searchInPosts = i4.SearchInPosts(this);
  late final i3.Likes likes = i3.Likes(this);
  late final i6.MyAccessor myAccessor = i6.MyAccessor(this as i7.Database);
  i5.UserQueriesDrift get userQueriesDrift => i8.ReadDatabaseContainer(this)
      .accessor<i5.UserQueriesDrift>(i5.UserQueriesDrift.new);
  i4.SearchDrift get searchDrift => i8.ReadDatabaseContainer(this)
      .accessor<i4.SearchDrift>(i4.SearchDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        teste,
        follows,
        popularUsers,
        i1.usersName,
        posts,
        searchInPosts,
        i4.postsInsert,
        i4.postsUpdate,
        i4.postsDelete,
        likes,
        i5.$drift0
      ];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('posts',
                limitUpdateKind: i0.UpdateKind.insert),
            result: [
              i0.TableUpdate('search_in_posts', kind: i0.UpdateKind.insert),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('posts',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('search_in_posts', kind: i0.UpdateKind.insert),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('posts',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('search_in_posts', kind: i0.UpdateKind.insert),
            ],
          ),
        ],
      );
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}
