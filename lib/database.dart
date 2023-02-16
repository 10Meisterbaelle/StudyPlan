import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StringListDatabase {
  static final String tableName = 'string_lists';

  late Database _database;

  Future<void> open() async {
    final path = await getDatabasesPath();
    _database = await openDatabase(
      join(path, 'string_list_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, strings TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<List<String>> getStringList() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    if (maps.isEmpty) {
      return <String>[];
    }
    final String stringList = maps[0]['strings'];
    return stringList.split(';');
  }

  Future<void> saveStringList(List<String> strings) async {
    final String stringList = strings.join(';');
    await _database.delete(tableName);
    await _database.insert(tableName, {'strings': stringList});
  }

  Future<void> close() async => _database.close();
}

class DatabaseLifecycleObserver extends WidgetsBindingObserver {
  final StringListDatabase database;

  DatabaseLifecycleObserver(this.database);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      await database.close();
    }
  }
}
