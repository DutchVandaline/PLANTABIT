import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:PlanTodo/Theme/DarkTheme.dart';
import 'package:PlanTodo/Theme/LightTheme.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

ThemeData fightTheme = LightTheme().theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TodoNotifier()),
        ChangeNotifierProvider.value(value: PlantNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme().theme,
        darkTheme: DarkTheme().theme,
        home: Splash(),
      ),
    );
  }
}
