import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.teal[400],
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal[400],
        titleTextStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    tabBarTheme: TabBarTheme(
        labelColor: Colors.teal[400],
        labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        unselectedLabelColor: Colors.grey[600],
        unselectedLabelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
    ),
    textTheme: TextTheme(
        headline1: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Colors.grey[800]),
        subtitle1: TextStyle(fontSize: 20, color: Colors.grey[800]),
        subtitle2: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey[800])
    )
);

extension CustomThemeData on ThemeData {
    Color get privateStandardColor => Colors.lightGreen[400]!;
    Color get commercialStandardColor => Colors.orange[200]!;
    Color get navBarColor => Colors.blueGrey[100]!;
    Color get navBarUnselectedColor => Colors.grey[600]!;
}

extension CustomTextTheme on TextTheme {
    TextStyle get smallText1 => TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey[800]);
}
