import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
        headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Colors.black),
        bodyText1: TextStyle(fontFamily: 'Sans-Serif', fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
        bodyText2: TextStyle(fontFamily: 'Sans-Serif', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)
    )
);
