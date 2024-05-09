import 'package:PlanTodo/DataBase/PlantDataBase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantHistoryTile extends StatefulWidget {
  final Plant plant;

  PlantHistoryTile({required this.plant});

  @override
  _PlantHistoryTileState createState() => _PlantHistoryTileState();
}

class _PlantHistoryTileState extends State<PlantHistoryTile> {
  bool isChecked = false;
  PlantDBHelper plantDBHelper = PlantDBHelper();

  Widget build(BuildContext context) {
    double currentState =
        (widget.plant.currentState / widget.plant.fullState) * 100;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        DateFormat("MMM")
                            .format(DateTime.parse(widget.plant.startingdate))
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 13.0)),
                    Text(
                        DateFormat("d")
                            .format(DateTime.parse(widget.plant.startingdate))
                            .toString(), // Date
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text(
                        DateFormat("EEE")
                            .format(DateTime.parse(widget.plant.startingdate))
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 13.0))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9 * currentState / 100,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        "${currentState.toStringAsFixed(1)}%",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
