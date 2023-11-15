import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.normal),
        subtitle1: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.normal),
        subtitle2: TextStyle(
            color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        headline1: TextStyle(
            color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
      ),
      brightness: Brightness.light,
      primaryColor: Color(0xFFe5e3d8),
      scaffoldBackgroundColor: Color(0xFFe5e3d8),
      cardColor: Colors.white,
      accentColor: Color(0xFF549e66),
      canvasColor: Colors.white,
      shadowColor: Color(
          0xFF708777), //,0xFFECB365, 0xFFead57f, 0xFFFABB51, 0xFFead5d9, 0xFF708777, 0xFFfae696
      indicatorColor: Color(0xFF696863),
      primaryColorLight: Colors.black,
      primaryColorDark: Colors.white,
      backgroundColor: Colors.white,
      hoverColor: Color(0xFFf5f6f6),
      dividerColor: Colors.grey.shade300);
}
