import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white, // 🔹 Info view screen background

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.blue, // 🔹 Blue AppBar
      foregroundColor: Colors.white,       // 🔹 Title & icons white
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,             // 🔹 ListTile background
      textColor: Colors.black,             // Optional: text color for contrast
      iconColor: Colors.black,             // Optional: icon color
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,       // Drawer background
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
