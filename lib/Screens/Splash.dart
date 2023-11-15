import 'dart:convert';
import 'package:PlanTodo/DataBase/DataBase.dart';
import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:PlanTodo/ListInput.dart';
import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:PlanTodo/Screens/InitialScreen.dart';
import 'package:after_layout/after_layout.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    DBHelper dbHelper = DBHelper();
    PlantDBHelper plantDBHelper = PlantDBHelper();
    DateTime now = DateTime.now();
    String id = memosha512(now.toString());
    String startingDate = DateFormat('yyyyMMdd').format(now);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomeScreen()));
    } else {
      await prefs.setBool('seen', true);
      for (int i = 0; i <= 3; i++) {
        dbHelper.insertWhatTodo(defaultInput[i]);
      }

      plantDBHelper.insertPlant(Plant(
          id: id, fullState: 4, currentState: 0, startingdate: startingDate));

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new InitialScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading"),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
}

String memosha512(String text) {
  var bytes = utf8.encode(text);
  var digest = sha512.convert(bytes);
  return digest.toString();
}
