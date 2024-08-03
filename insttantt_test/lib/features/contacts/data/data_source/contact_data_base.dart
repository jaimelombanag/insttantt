import 'package:flutter/foundation.dart' show immutable;
import 'package:insttantt_test/features/contacts/domain/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class ContactDatabase {
  static const String _databaseName = 'contact.db';
  static const int _databaseVersion = 1;

  // Create a singleton
  const ContactDatabase._privateConstructor();
  static const ContactDatabase instance = ContactDatabase._privateConstructor();

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
    const intType = 'INTEGER NOT NULL';
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $contactTable (
        ${ContactFields.id} $idType,
        ${ContactFields.name} $textType,
        ${ContactFields.identification} $intType
      )
      ''');
  }

  //! C --> CRUD = Create
  Future<Contact> createContact(Contact contact) async {
    final db = await instance.database;
    final id = await db.insert(
      contactTable,
      contact.toMap(),
    );

    return contact.copy(id: id);
  }

  //! R -- CURD = Read
  Future<Contact> readContact(int id) async {
    final db = await instance.database;

    final contactData = await db.query(
      contactTable,
      columns: ContactFields.values,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );

    if (contactData.isNotEmpty) {
      return Contact.fromMap(contactData.first);
    } else {
      throw Exception('Could not find a product with the given ID');
    }
  }

  // Get All contact
  Future<List<Contact>> readAllContact() async {
    final db = await instance.database;

    final result =
        await db.query(contactTable, orderBy: '${ContactFields.name} ASC');

    return result.map((productData) => Contact.fromMap(productData)).toList();
  }

  //! U --> CRUD = Update
  Future<int> updateConatct(Contact contact) async {
    final db = await instance.database;

    return await db.update(
      contactTable,
      contact.toMap(),
      where: '${ContactFields.id} = ?',
      whereArgs: [contact.id],
    );
  }

  //! D --> CRUD = Delete
  Future<int> deleteContact(int id) async {
    final db = await instance.database;

    return await db.delete(
      contactTable,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllContact() async {
    final db = await instance.database;

    return await db.delete(contactTable);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
