import 'dart:convert';
import 'package:PlanTodo/ListInput.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:PlanTodo/DataBase/DataBase.dart';
import 'DeletePopUp.dart';

String inputTodo = "";
String memo = "";
String changedDate = DateFormat('yyyyMMdd').format(DateTime.now());

class EditTodoScreen extends StatefulWidget {
  final WhatTodo whatTodo;

  EditTodoScreen({required this.whatTodo});

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final todoController = TextEditingController();
  final memoController = TextEditingController();

  @override
  void initState() {
    todoController.text = widget.whatTodo.whatTodo;
    memoController.text = widget.whatTodo.memo;
    inputTodo = widget.whatTodo.whatTodo;
    memo = widget.whatTodo.memo;
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    memoController.dispose();
    inputTodo = "";
    memo = "";
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
                )),
          ),
          actions: [
            exceptionList.contains(widget.whatTodo.id)
                ? Text("")
                : IconButton(
                    onPressed: () {
                      _showDialog();
                    },
                    icon: Icon(Icons.delete))
          ],
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
                      "들이고 싶은 습관을\n수정하세요.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 34.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                exceptionList.contains(widget.whatTodo.id)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: double.infinity,
                          child: Text(
                            "환경과 관련된 일과는 수정 ・ 삭제가 불가합니다.",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
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
                      enabled: exceptionList.contains(widget.whatTodo.id)
                          ? false
                          : true,
                      onChanged: (text) {
                        inputTodo = text;
                      },
                      style: exceptionList.contains(widget.whatTodo.id)
                          ? Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey)
                          : Theme.of(context).textTheme.subtitle1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText: "들이고 싶은 습관을 수정하세요.",
                      ),
                      cursorColor: Theme.of(context).focusColor,
                      autofocus: false,
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
                      textInputAction: TextInputAction.done,
                      controller: memoController,
                      maxLines: null,
                      enabled: exceptionList.contains(widget.whatTodo.id)
                          ? false
                          : true,
                      onChanged: (text) {
                        //memo = widget.whatTodo.memo;
                        memo = text;
                      },
                      style: exceptionList.contains(widget.whatTodo.id)
                          ? Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey)
                          : Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(height: 1.5),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText: "습관과 관련된 메모를 수정하세요.",
                      ),
                      cursorColor: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ],
            ), //입력창

            Column(
              children: [
                InkWell(
                  onTap: () {
                    exceptionList.contains(widget.whatTodo.id)
                        ? Navigator.pop(context)
                        : updateTodo(context);
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Center(
                        child: Text(
                      exceptionList.contains(widget.whatTodo.id)
                          ? "돌아가기"
                          : "수정하기",
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

  void updateTodo(BuildContext context) {
    Provider.of<TodoNotifier>(context, listen: false).updateTodo(
      widget.whatTodo.id,
      inputTodo,
      widget.whatTodo.finished,
      widget.whatTodo.waterStat,
      widget.whatTodo.nutritionStat,
      widget.whatTodo.pointStat,
      widget.whatTodo.show,
      changedDate,
      memo,
    );
    Navigator.pop(context);
  }

  String memosha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }

  _showDialog() {
    showDialog(
        context: this.context,
        builder: (context) {
          return DeletePopUp(widget.whatTodo);
        });
  }
}
