import 'dart:async';
import 'dart:math';
import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:PlanTodo/DataBase/DataBase.dart';
import 'package:PlanTodo/Screens/EditTodoScreen.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

String changedDate = DateFormat('yyyyMMdd').format(DateTime.now());
int showState = 0;

class TodoListTile extends StatefulWidget {
  final WhatTodo whatTodo;
  final bool fromNewScreen;

  TodoListTile({
    required this.whatTodo,
    required this.fromNewScreen,
  });

  @override
  _TodoListTileState createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  ConfettiController controller =
      ConfettiController(duration: Duration(seconds: 2));
  double _animationWidth = 0.0;
  bool isChecked = false;
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      changeDate();
    });
  }

  void changeDate() {
    widget.whatTodo.changedDate != changedDate
        ? updateFinishedtoZero(context)
        : print("오늘입니다.");
  }

  @override
  Widget build(BuildContext context) {
    widget.whatTodo.finished == 1
        ? _animationWidth = MediaQuery.of(context).size.width
        : _animationWidth = 0.0;
    return GestureDetector(
      onLongPress: () {
        print(widget.whatTodo.changedDate);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditTodoScreen(whatTodo: widget.whatTodo)));
      },
      onTap: () {
        if (widget.whatTodo.finished == 0) {
          updateFinishedtoOne(context);
          setState(() {
            _animationWidth = MediaQuery.of(context).size.width;
          });
          controller.play();

          Provider.of<PlantNotifier>(context, listen: false)
                      .growingplant
                      .length ==
                  0
              ? print("식물이 없습니다.")
              : updateState(context);
        } else if (widget.whatTodo.finished == 1) {
          updateFinishedtoZero(context);
          setState(() {
            _animationWidth = 0.0;
          });
          Provider.of<PlantNotifier>(context, listen: false)
                      .growingplant
                      .length ==
                  0
              ? print("식물이 없습니다.")
              : undoState(context);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: widget.fromNewScreen
                      ? MediaQuery.of(context).size.height * 0.3
                      : MediaQuery.of(context).size.height * 0.095,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                AnimatedContainer(
                  height: widget.fromNewScreen
                      ? MediaQuery.of(context).size.height * 0.3
                      : MediaQuery.of(context).size.height * 0.095,
                  width: _animationWidth,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  duration: Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: controller,
            colors: [
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.green,
              Colors.purpleAccent,
            ],
            shouldLoop: false,
            numberOfParticles: 50,
            blastDirection: -pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
          ),
        ],
      ),
    );
  }

  void updateFinishedtoOne(BuildContext context) {
    Provider.of<TodoNotifier>(context, listen: false).updateTodo(
      widget.whatTodo.id,
      widget.whatTodo.whatTodo,
      1,
      widget.whatTodo.waterStat,
      widget.whatTodo.nutritionStat,
      widget.whatTodo.pointStat,
      widget.whatTodo.show,
      changedDate,
      widget.whatTodo.memo,
    );
  }

  void updateFinishedtoZero(BuildContext context) {
    Provider.of<TodoNotifier>(context, listen: false).updateTodo(
        widget.whatTodo.id,
        widget.whatTodo.whatTodo,
        0,
        widget.whatTodo.waterStat,
        widget.whatTodo.nutritionStat,
        widget.whatTodo.pointStat,
        widget.whatTodo.show,
        changedDate,
        widget.whatTodo.memo);
  }

  void updateState(BuildContext context) {
    Plant plantModule =
        Provider.of<PlantNotifier>(context, listen: false).growingplant.last;

    String id = plantModule.id;
    int fullState = plantModule.fullState;
    int currentState = plantModule.currentState;
    String startingdate = plantModule.startingdate;

    Provider.of<PlantNotifier>(context, listen: false).updatePlant(
      id,
      fullState,
      currentState + 1,
      startingdate,
    );
  }

  void undoState(BuildContext context) {
    Plant plantModule =
        Provider.of<PlantNotifier>(context, listen: false).growingplant.last;

    String id = plantModule.id;
    int fullState = plantModule.fullState;
    int currentState = plantModule.currentState;
    String startingdate = plantModule.startingdate;

    Provider.of<PlantNotifier>(context, listen: false).updatePlant(
      id,
      fullState,
      currentState - 1,
      startingdate,
    );
  }
}
