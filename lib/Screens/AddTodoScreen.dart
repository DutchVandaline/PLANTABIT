import 'dart:convert';
import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:PlanTodo/ListInput.dart';
import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

String inputTodo = "";
String memo = "";

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoController = TextEditingController();
  final memoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.0,
                  color: Theme.of(context).primaryColorLight,
                )),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "들이고 싶은 습관을\n입력하세요.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 34.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: todoController,
                      onChanged: (text) {
                        inputTodo = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText: "들이고 싶은 습관을 입력하세요",
                      ),
                      cursorColor: Theme.of(context).accentColor,
                      autofocus: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Center(
                    child: Container(
                      height: 50.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: todoSampleList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListViewWidget(
                            inputText: todoSampleList[index],
                            todoController: todoController,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: memoController,
                      textInputAction: TextInputAction.done,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(height: 1.5),
                      maxLines: null,
                      onChanged: (text) {
                        memo = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText: "습관과 관련된 메모를 입력하세요.",
                      ),
                      cursorColor: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ), //입력창
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      updatePlantState(context);
                      if (inputTodo == todoSampleList[5] && memo == "타일러 더든") {
                        print("fightclub");
                        saveFightClub(context);
                      } else {
                        saveTodo(context);
                      }
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Center(
                        child: Text(
                      "추가하기",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void saveTodo(BuildContext context) {
    DateTime now = DateTime.now();
    String id = memosha512(now.toString());
    String changedState = DateFormat('yyyyMMdd').format(now);
    Provider.of<TodoNotifier>(context, listen: false).addTodo(
      id,
      inputTodo,
      0,
      5,
      5,
      0,
      0,
      changedState,
      memo,
    );
    Navigator.pop(context);
  }

  void saveFightClub(BuildContext context) {
    DateTime now = DateTime.now();
    String id = memosha512(now.toString());
    String changedState = DateFormat('yyyyMMdd').format(now);
    Provider.of<TodoNotifier>(context, listen: false).addTodo(
      id,
      fightClubWhatTodo,
      0,
      100,
      100,
      0,
      0,
      changedState,
      fightClubMemo,
    );
    Navigator.pop(context);
  }

  void updatePlantState(BuildContext context) {
    Plant plantModule =
        Provider.of<PlantNotifier>(context, listen: false).growingplant.last;

    String id = plantModule.id;
    int fullState = plantModule.fullState;
    int currentState = plantModule.currentState;
    String startingdate = plantModule.startingdate;

    Provider.of<PlantNotifier>(context, listen: false).updatePlant(
      id,
      fullState + 1,
      currentState,
      startingdate,
    );
  }

  String memosha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }
}

class ListViewWidget extends StatefulWidget {
  final String inputText;
  final todoController;

  ListViewWidget({required this.inputText, required this.todoController});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.todoController.text = widget.inputText;
            inputTodo = widget.inputText;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.inputText,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )),
        ),
      ),
    );
  }
}
