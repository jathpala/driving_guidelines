// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

// Colors
final _primary = Colors.teal[400]!;
final _secondary = Colors.blue[100]!;
final _onSecondary = Colors.indigo[400]!;
final _surface = Colors.teal[50]!;
final _onSurface = Colors.grey[700]!;
const _background = Colors.white;
final _onBackground = Colors.grey[900]!;
final _outline = Colors.grey[400]!;
final _outlineVariant = Colors.grey[200]!;
final _error = Colors.red[400]!;

// Text styles
const _titleLarge = TextStyle(fontSize: 24);
const _titleMedium = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
const _titleSmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
const _labelMedium = TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
const _bodyLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const _bodyMedium = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
const _bodySmall = TextStyle(fontSize: 14, fontWeight: FontWeight.w300);


final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _primary,
        onPrimary: _background,
        secondary: _secondary,
        onSecondary: _onSecondary,
        error: _error,
        onError: _background,
        background: _background,
        onBackground: _onBackground,
        surface: _surface,
        onSurface: _onSurface,
        outline: _outline
    ),
    textTheme: const TextTheme(
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: _primary,
        foregroundColor: _background,
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _surface,
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) => states.contains(MaterialState.selected)
                ? TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _onSecondary)
                : TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _onSurface)
        )
    ),
    dividerTheme: DividerThemeData(
        color: _outlineVariant,
        indent: 15.0,
        endIndent: 15.0
    ),
    listTileTheme: ListTileThemeData(
        tileColor: _background,
        textColor: _onBackground,
        titleTextStyle: _titleMedium,
        subtitleTextStyle: _labelMedium
    ),
    tabBarTheme: TabBarTheme(
        labelColor: _primary,
        unselectedLabelColor: _onSurface
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _secondary,
        foregroundColor: _background
    )
);

extension CustomThemeData on ThemeData {
    Color get privateStandardColor => Colors.lightGreen[400]!;
    Color get commercialStandardColor => Colors.orange[200]!;
}

// TODO: Remove this once dialog box is updated
extension CustomTextTheme on TextTheme {
    TextStyle get smallText1 => TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey[800]);
}
