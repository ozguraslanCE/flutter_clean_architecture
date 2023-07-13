import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme();
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0, color: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }
}
