import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.teal[400],
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal[400],
        titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Colors.grey[800]),
        subtitle1: TextStyle(fontSize: 20, color: Colors.grey[800]),
        subtitle2: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey[800])
    )
);

extension CustomThemeData on ThemeData {
    Color get privateStandardColor => Colors.lightGreen[300]!;
    Color get privateStandardColorDarkened => Colors.lightGreen[900]!;
    Color get commercialStandardColor => Colors.orange[200]!;
    Color get commercialStandardColorDarkened => Colors.yellow[900]!;
    Color get navBarColor => Colors.blueGrey[100]!;
    Color get navBarUnselectedColor => Colors.grey[600]!;
}
