import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:flutter/material.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:provider/provider.dart';
import 'package:PlanTodo/DataBase/DataBase.dart';
import 'package:sqflite/sqflite.dart';

class DeletePopUp extends StatelessWidget {
  final WhatTodo selectedtodo;
  DeletePopUp(this.selectedtodo);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        "삭제 확인",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      content: Text(
        "정말로 삭제하시겠습니까?",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: InkWell(
            child: Text("삭제"),
            onTap: () async {
              Provider.of<TodoNotifier>(context, listen: false)
                  .deleteWhatTodo(selectedtodo.id);
              undoState(context);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: InkWell(
            child: Text("돌아가기"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}

Future<void> undoState(BuildContext context) async {
  Plant plantModule =
      Provider.of<PlantNotifier>(context, listen: false).growingplant.last;
  DBHelper dbHelper = DBHelper();

  String id = plantModule.id;
  int fullState = Provider.of<TodoNotifier>(context, listen: false).whatTodoes.length;
  int currentState = await dbHelper.countFinished();
  String startingdate = plantModule.startingdate;

  Provider.of<PlantNotifier>(context, listen: false).updatePlant(
    id,
    fullState,
    currentState,
    startingdate,
  );
}