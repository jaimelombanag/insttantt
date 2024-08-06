import 'package:flutter/foundation.dart' show immutable;
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class UserDatabase {
  static const String _databaseName = ComunNamesConst.nameDBuser;
  static const int _databaseVersion = ComunNamesConst.versionDBuser;

  // Create a singleton
  const UserDatabase._privateConstructor();
  static const UserDatabase instance = UserDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDB,
    );
  }

  //! Create Database method
  Future _createDB(
    Database db,
    int version,
  ) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $userTable (
        ${UserFields.id} $idType,
        ${UserFields.name} $textType,
        ${UserFields.email} $textType,
        ${UserFields.password} $textType
      )
      ''');
  }

  //! C --> CRUD = Create
  Future<User> createUser(User user) async {
    final db = await instance.database;
    final id = await db.insert(
      userTable,
      user.toMap(),
    );

    return user.copy(id: id);
  }

  //! R -- CURD = Read
  Future<User> readUser(int id) async {
    final db = await instance.database;

    final userData = await db.query(
      userTable,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (userData.isNotEmpty) {
      return User.fromMap(userData.first);
    } else {
      throw Exception('Could not find a user with the given ID');
    }
  }

  Future<User?> getUser(String email, String password) async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<User> readUserEmail(String email) async {
    final db = await instance.database;

    final userData = await db.query(
      userTable,
      columns: UserFields.values,
      where: '${UserFields.email} = ?',
      whereArgs: [email],
    );

    if (userData.isNotEmpty) {
      return User.fromMap(userData.first);
    } else {
      return const User(name: '', email: '', password: '');
      //throw Exception('Could not find a user with the given ID');
    }
  }

  // Get All Users
  Future<List<User>> readAllUser() async {
    final db = await instance.database;
    final result = await db.query(userTable, orderBy: '${UserFields.name} ASC');
    return result.map((userData) => User.fromMap(userData)).toList();
  }

  //! U --> CRUD = Update
  Future<int> updateUser(User user) async {
    final db = await instance.database;

    return await db.update(
      userTable,
      user.toMap(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  //! D --> CRUD = Delete
  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return await db.delete(
      userTable,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllUser() async {
    final db = await instance.database;
    return await db.delete(
      userTable,
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
