import 'package:flutter/foundation.dart';
import 'package:PlanTodo/DataBase/DataBase.dart';

import '../ListInput.dart';

class TodoNotifier extends ChangeNotifier {
  List _whatTodoes = [];

  List get whatTodoes {
    return [..._whatTodoes];
  }

  Future deleteWhatTodo(String id) {
    _whatTodoes.removeWhere((element) => element.id == id);
    notifyListeners();
    return DBHelper().deleteWhatTodo(id);
  }

  Future addTodo(
    String id,
    String whatTodo,
    int finished,
    int waterStat,
    int nutritionStat,
    int pointStat,
    int show,
    String changedDate,
    String memo,
  ) async {
    final todoitem = WhatTodo(
      id: id,
      whatTodo: whatTodo,
      finished: finished,
      waterStat: waterStat,
      nutritionStat: nutritionStat,
      pointStat: pointStat,
      show: show,
      changedDate: changedDate,
      memo: memo,
    );

    _whatTodoes.insert(_whatTodoes.length, todoitem);

    notifyListeners();

    DBHelper().insertWhatTodo(todoitem);
  }

  Future updateTodo(
      String id,
      String whatTodo,
      int finished,
      int waterStat,
      int nutritionStat,
      int pointStat,
      int show,
      String changedDate,
      String memo) async {
    final todoitem = WhatTodo(
      id: id,
      whatTodo: whatTodo,
      finished: finished,
      waterStat: waterStat,
      nutritionStat: nutritionStat,
      pointStat: pointStat,
      show: show,
      changedDate: changedDate,
      memo: memo,
    );

    _whatTodoes[_whatTodoes.indexWhere((element) => element.id == id)] =
        todoitem;

    notifyListeners();

    DBHelper().updateWhatTodo(todoitem);
  }

  Future getTodo() async {
    final todoList = await DBHelper().getwhatTodoes(0);

    _whatTodoes = todoList.map((item) {
      return WhatTodo(
        id: item.id,
        whatTodo: item.whatTodo,
        finished: item.finished,
        waterStat: item.waterStat,
        nutritionStat: item.nutritionStat,
        pointStat: item.pointStat,
        show: item.show,
        changedDate: item.changedDate,
        memo: item.memo,
      );
    }).toList();

    _whatTodoes.sort((a, b) => a.id.length.compareTo(b.id.length));
    notifyListeners();
  }
}
