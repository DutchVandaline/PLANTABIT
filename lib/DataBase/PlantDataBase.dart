import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//TODO: SQFlite에서는 Bool타입이 존재하지 X. 따라서 INT 타입 0과 1로 선언함.

class PlantDBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'plants.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE plants( id TEXT PRIMARY KEY, fullState INT, currentState INT, startingdate TEXT)",
        );
      },
      version: 1,
    );
    return _db;
  }

  Future<void> insertPlant(Plant plant) async {
    final Database db = await database;
    await db.insert(
      'plants',
      plant.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("insert plants $plant");
  }

  Future<List<Plant>> getplants() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('plants');

    return List.generate(maps.length, (i) {
      return Plant(
        id: maps[i]['id'],
        fullState: maps[i]['fullState'],
        currentState: maps[i]['currentState'],
        startingdate: maps[i]['startingdate'],
      );
    });
  }

  Future<List<Plant>> findPlant(String id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('plants', where: 'id = ?', whereArgs: [id]);

    return List.generate(maps.length, (i) {
      return Plant(
        id: maps[i]['id'],
        fullState: maps[i]['fullState'],
        currentState: maps[i]['currentState'],
        startingdate: maps[i]['startingdate'],
      );
    });
  }

  Future<void> updatePlant(Plant plant) async {
    final db = await database;

    await db.update(
      'plants',
      plant.toMap(),
      where: "id = ?",
      whereArgs: [plant.id],
    );
    print("update movie $plant");
  }

  Future<void> deletePlant(String id) async {
    final db = await database;

    await db.delete(
      'plants',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

class Plant {
  final String id;
  final int fullState;
  final int currentState;
  final String startingdate;

  Plant(
      {this.id = "",
      required this.fullState,
      required this.currentState,
      required this.startingdate,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullState': fullState,
      'currentState': currentState,
      'startingdate': startingdate,
    };
  }

  @override
  String toString() {
    return 'Plant{ id : $id ,fullState: $fullState, currentState: $currentState, startingdate: $startingdate}';
  }
}
