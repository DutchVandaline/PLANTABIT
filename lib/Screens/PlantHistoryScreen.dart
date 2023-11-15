import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Widgets/PlantHistoryTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantHistoryScreen extends StatefulWidget {
  @override
  State<PlantHistoryScreen> createState() => _PlantHistoryScreenState();
}

class _PlantHistoryScreenState extends State<PlantHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "HISTORY",
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  child: Text(
                "PLANTABIT은 환경 오염을 막기 위해\n서버를 운영하지 않습니다.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 18.0),
              ))),
          Expanded(
            flex: 10,
            child: FutureBuilder(
                future: Provider.of<PlantNotifier>(context, listen: false)
                    .getPlant(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Scaffold(
                      body: Consumer<PlantNotifier>(
                        builder: (context, currentplant, child) =>
                            currentplant.growingplant.length <= 0
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '기른 식물이 없습니다.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: currentplant.growingplant.length,
                                    itemBuilder: (context, index) {
                                      final i = index;
                                      final planting =
                                          currentplant.growingplant[i];

                                      return PlantHistoryTile(
                                        plant: planting
                                      );
                                    }),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
