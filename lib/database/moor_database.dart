import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().withLength(max: 16)();
  TextColumn get email => text().withLength(max: 16)();
  TextColumn get lastName => text().withLength(max: 16)();
  TextColumn get name => text().withLength(max: 16)();
  TextColumn get gender => text().withLength(max: 16)();
  TextColumn get dateOfBirth => text().withLength(max: 16)();
  TextColumn get phone => text().withLength(max: 16)();
  TextColumn get groupName => text().withLength(max: 16)();
  IntColumn get status => integer()();
  IntColumn get groupId => integer()();
  TextColumn get avatar => text().nullable()();
}

class Cart extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get imageUrl => text().withLength(max: 16)();
  IntColumn get quantity => integer()();
}

@UseMoor(tables: [User, Cart], daos: [UserDao, CartDao])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAllTables();
      },
    );
  }
}

@UseDao(tables: [Cart])
class CartDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  CartDao(this.db) : super(db);

  Future insertCart(Insertable<CartData> cart) => into(db.cart).insert(cart);
  Stream<List<CartData>> watchCarts() => select(db.cart).watch();
}

@UseDao(tables: [User])
class UserDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  UserDao(this.db) : super(db);

  Future insertUser(Insertable<UserData> user) => into(db.user).insert(user);
  Stream<List<UserData>> watchUsers() => select(db.user).watch();
}
