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
  IntColumn get refId => integer()();
  TextColumn get imageUrl => text()();
  TextColumn get price => text()();
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
}

class CartCount extends Table {
  IntColumn get count => integer()();
}

@UseMoor(
    tables: [User, Cart, CartCount], daos: [UserDao, CartDao, CartCountDao])
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

  Stream<List<CartData>> getAllCarts() => select(db.cart).watch();

  Future updateCart(CartData cart) => update(db.cart).replace(cart);

  Stream<List<CartData>> isRowExist(int id) {
    return customSelectStream(
      'SELECT * FROM cart WHERE ref_id = ' + id.toString(),
      // The Stream will emit new values when the data inside the Tasks table changes
      readsFrom: {db.cart},
    ).map((rows) {
      // Turning the data of a row into a Task object
      return rows.map((row) => CartData.fromData(row.data, db)).toList();
    });
  }
}

@UseDao(tables: [CartCount])
class CartCountDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  CartCountDao(this.db) : super(db);

  Future insertCount(Insertable<CartCountData> count) =>
      into(db.cartCount).insert(count);
  Stream<List<CartCountData>> watchCount() => select(db.cartCount).watch();
}

@UseDao(tables: [User])
class UserDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  UserDao(this.db) : super(db);

  Future insertUser(Insertable<UserData> user) => into(db.user).insert(user);
  Stream<List<UserData>> watchUsers() => select(db.user).watch();
}
