import 'package:flutter/material.dart';

final class AppTheme {
  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo[300]
    ),
  );

  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo[900],
    ),
  );

  AppTheme._();
}
