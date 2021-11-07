import 'dart:convert';
import 'dart:ffi';

import 'package:logistic/models/spending_list_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int? _version = 1;
  static const String _tableName = 'notes';
  static const String _dbName = 'notes.db';
  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + _dbName;
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print('creating new one');
        return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT,title STRING, amount STRING, createAt STRING, isComplete INTEGER )');
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> addNote(Note notes) async {
    await _db?.insert(
      _tableName,
      notes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteNote(int id) async {
    await _db?.delete(
      _tableName,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
  static Future<List<Note>> getListNote() async {
    final List<Map<String, dynamic>> maps = await _db!.query(_tableName);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'] ,
        title: maps[i]['title'],
        amount: maps[i]['amount'].toString(),
        createAt: maps[i]['createAt'].toString(),
        isComplete: maps[i]['isComplete'],
      );
    });
  }
}
