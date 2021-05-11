import 'package:flutter/material.dart';

final lightTheme = ThemeData(backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.orangeAccent,
    unselectedItemColor: Colors.black,
  ),
  primaryColor: Colors.blue,
);

final darkTheme = ThemeData(backgroundColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey,
    ),
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.blueGrey,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.deepOrangeAccent,
      unselectedItemColor: Colors.black,
    ));
