import 'package:flutter/foundation.dart';
import 'package:PlanTodo/DataBase/PlantDataBase.dart';

class PlantNotifier extends ChangeNotifier {
  List _growingplant = [];

  List get growingplant {
    return [..._growingplant];
  }

  Future getPlant() async {
    final plants = await PlantDBHelper().getplants();

    _growingplant = plants
        .map((item) => Plant(
              id: item.id,
              fullState: item.fullState,
              currentState: item.currentState,
              startingdate: item.startingdate,
            ))
        .toList();

    notifyListeners();
  }

  Future addPlant(
    String id,
    int fullState,
    int currentState,
    String startingdate,
  ) async {
    final nowPlant = Plant(
      id: id,
      fullState: fullState,
      currentState: currentState,
      startingdate: startingdate,
    );

    _growingplant.insert(0, nowPlant);

    notifyListeners();

    PlantDBHelper().insertPlant(nowPlant);
  }

  Future updatePlant(
    String id,
    int fullState,
    int currentState,
    String startingdate,
  ) async {
    final nowPlant = Plant(
      id: id,
      fullState: fullState,
      currentState: currentState,
      startingdate: startingdate,
    );

    _growingplant[_growingplant.indexWhere(
        (element) => element.id == id)] = nowPlant;

    notifyListeners();

    PlantDBHelper().updatePlant(nowPlant);
  }

  Future deletePlant(String id) {
    _growingplant.removeWhere((element) => element.id == id);
    notifyListeners();
    return PlantDBHelper().deletePlant(id);
  }
}
