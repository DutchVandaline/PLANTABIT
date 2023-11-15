import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//TODO: SQFlite에서는 Bool타입이 존재하지 X. 따라서 INT 타입 0과 1로 선언함.

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'whatTodoes.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE whatTodoes(id TEXT PRIMARY KEY, whatTodo TEXT, finished INT, waterStat INT, nutritionStat INT, pointStat INT, show INT, changedDate TEXT, memo TEXT)",
        );
      },
      version: 1,
    );
    return _db;
  }


  Future<void> insertWhatTodo(WhatTodo whatTodo) async {
    final Database db = await database;

    await db.insert(
      'whatTodoes',
      whatTodo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("insert todo $whatTodo");
  }

  Future<List<WhatTodo>> getwhatTodoes(int numb) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('whatTodoes', where: 'show = ?', whereArgs: [numb]);

    return List.generate(maps.length, (i) {
      return WhatTodo(
        id: maps[i]['id'],
        whatTodo: maps[i]['whatTodo'],
        finished: maps[i]['finished'],
        waterStat: maps[i]['waterStat'],
        nutritionStat: maps[i]['nutritionStat'],
        pointStat: maps[i]['pointStat'],
        show: maps[i]['show'],
        changedDate: maps[i]['changedDate'],
        memo: maps[i]['memo'],
      );
    });
  }

  Future<int> countFinished() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps =
    await db.query('whatTodoes', where: 'finished = ?', whereArgs: [1]);

    return maps.length;
  }

  Future<List<WhatTodo>> findWhatTodo(String id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('whatTodoes', where: 'id = ?', whereArgs: [id]);

    return List.generate(maps.length, (i) {
      return WhatTodo(
        id: maps[i]['id'],
        whatTodo: maps[i]['whatTodo'],
        finished: maps[i]['finished'],
        waterStat: maps[i]['waterStat'],
        nutritionStat: maps[i]['nutritionStat'],
        pointStat: maps[i]['pointStat'],
        show: maps[i]['show'],
        changedDate: maps[i]['changedDate'],
        memo: maps[i]['memo'],
      );
    });
  }

  Future<void> updateWhatTodo(WhatTodo whatTodo) async {
    final db = await database;

    await db.update(
      'whatTodoes',
      whatTodo.toMap(),
      where: "id = ?",
      whereArgs: [whatTodo.id],
    );
    print("update movie $whatTodo");
  }

  Future<void> deleteWhatTodo(String id) async {
    final db = await database;

    await db.delete(
      'whatTodoes',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

class WhatTodo {
  final String id;
  final String whatTodo;
  final int finished;
  final int waterStat;
  final int nutritionStat;
  final int pointStat;
  final int show;
  final String changedDate;
  final String memo;

  WhatTodo({
    required this.id,
    required this.whatTodo,
    required this.finished,
    required this.waterStat,
    required this.nutritionStat,
    required this.pointStat,
    required this.show,
    required this.changedDate,
    required this.memo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'whatTodo': whatTodo,
      'finished': finished,
      'waterStat': waterStat,
      'nutritionStat': nutritionStat,
      'pointStat': pointStat,
      'show': show,
      'changedDate': changedDate,
      'memo': memo,
    };
  }

  @override
  String toString() {
    return 'WhatTodo{id: $id, whatTodo: $whatTodo, finished: $finished, waterStat: $waterStat, nutritionStat: $nutritionStat, pointStat: $pointStat, show: $show, changedDate : $changedDate, memo: $memo}';
  }
}
