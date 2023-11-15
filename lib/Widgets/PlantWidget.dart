import 'dart:convert';
import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:PlanTodo/ListInput.dart';
import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PlantWidgetSub extends StatefulWidget {
  final Plant currentPlant;
  final bool fromNewScreen;
  PlantWidgetSub({required this.currentPlant, required this.fromNewScreen});

  @override
  State<PlantWidgetSub> createState() => _PlantWidgetSubState();
}

class _PlantWidgetSubState extends State<PlantWidgetSub> {
  void initState() {
    Future.delayed(Duration.zero, () {
      changeDate();
    });
    super.initState();
  }

  void changeDate() {
    String plantDate = DateFormat('yyyyMMdd').format(DateTime.now());
    String databaseDate = widget.currentPlant.startingdate;

    print(plantDate);
    print(databaseDate);

    if (plantDate != databaseDate) {
      savePlant(context);
    } else {
      print("오늘 식물입니다");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  height: MediaQuery.of(context).size.width *
                      0.5 *
                      (widget.currentPlant.currentState /
                          widget.currentPlant.fullState),
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Theme.of(context).accentColor,
                ),
                Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset('images/monstera.png'),
                    )),
              ]),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(plantEngName, style: Theme.of(context).textTheme.bodyText1),
            widget.fromNewScreen
                ? SizedBox(
                    height: 0.0,
                  )
                : Text(
                    "터치하여 완료, 길게 눌러 수정하세요!",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ],
    );
  }
}

class PlantDummyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor //Color(0xFFefd471)
                  ),
              child: Center(child: Text("식물이 없습니다."))),
        ),
        SizedBox(
          height: 15.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("식물을 추가하세요", style: Theme.of(context).textTheme.bodyText1),
            Text("터치하여 완료, 길게 눌러 수정하세요!",
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ],
    );
  }
}

void savePlant(BuildContext context) {
  String id = memosha512(DateTime.now().toString());
  String plantDate = DateFormat('yyyyMMdd').format(DateTime.now());
  int fullState =
      Provider.of<TodoNotifier>(context, listen: false).whatTodoes.length;

  Provider.of<PlantNotifier>(context, listen: false).addPlant(
    id,
    fullState,
    plantList[0].currentState,
    plantDate,
  );
  Navigator.of(context).popUntil((route) => route.isFirst);
}

String memosha512(String text) {
  var bytes = utf8.encode(text);
  var digest = sha512.convert(bytes);
  return digest.toString();
}
