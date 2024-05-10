import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseHelper {
  static Database? _database;
  static final _tableName = 'users';

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'user_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(String username, String password) async {
    final db = await database;
    await db?.insert(
      _tableName,
      {'username': username, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db!.query(
      _tableName,
      where: "username = ?",
      whereArgs: [username],
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<void> registerUser(String username, String password) async {
    final db = await database;
    await db?.insert(
      _tableName,
      {'username': username, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
