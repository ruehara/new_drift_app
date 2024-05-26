// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:new_app_drift/src/core/database/tables/teste.drift.dart' as i1;
import 'package:new_app_drift/src/core/database/tables/users.drift.dart' as i2;
import 'package:new_app_drift/src/core/database/tables/posts.drift.dart' as i3;
import 'package:new_app_drift/src/core/database/tables/search.drift.dart' as i4;
import 'package:new_app_drift/src/core/database/tables/user_queries.drift.dart'
    as i5;
import 'package:new_app_drift/src/core/database/accessor.dart' as i6;
import 'package:new_app_drift/src/core/database/database.dart' as i7;
import 'package:drift/internal/modular.dart' as i8;

abstract class $Database extends i0.GeneratedDatabase {
  $Database(i0.QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final i1.Teste teste = i1.Teste(this);
  late final i2.Users users = i2.Users(this);
  late final i3.Posts posts = i3.Posts(this);
  late final i4.SearchInPosts searchInPosts = i4.SearchInPosts(this);
  late final i3.Likes likes = i3.Likes(this);
  late final i2.Follows follows = i2.Follows(this);
  late final i2.PopularUsers popularUsers = i2.PopularUsers(this);
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
        teste,
        users,
        posts,
        searchInPosts,
        i4.postsInsert,
        i4.postsUpdate,
        i4.postsDelete,
        likes,
        follows,
        popularUsers,
        i2.usersName,
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
}

class $DatabaseManager {
  final $Database _db;
  $DatabaseManager(this._db);
  i1.$TesteTableManager get teste => i1.$TesteTableManager(_db, _db.teste);
  i2.$UsersTableManager get users => i2.$UsersTableManager(_db, _db.users);
  i3.$PostsTableManager get posts => i3.$PostsTableManager(_db, _db.posts);
  i4.$SearchInPostsTableManager get searchInPosts =>
      i4.$SearchInPostsTableManager(_db, _db.searchInPosts);
  i3.$LikesTableManager get likes => i3.$LikesTableManager(_db, _db.likes);
  i2.$FollowsTableManager get follows =>
      i2.$FollowsTableManager(_db, _db.follows);
}
