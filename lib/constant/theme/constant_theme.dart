import 'package:flutter/material.dart';

final theme = ThemeData(
  canvasColor: Color(0xff17181c),
  textTheme: TextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff17181c),
    elevation: 0,
    iconTheme: IconThemeData(
      size: 20,
      color: Colors.white,
    ),
    toolbarTextStyle: TextTheme(
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ).bodyMedium,
    titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ).titleLarge,
  ),
);
