import 'package:flutter/material.dart';

final customTheme = ThemeData(
    useMaterial3: true,
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.red),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.purple),
    colorScheme: ColorScheme.fromSeed(
        primary: const Color.fromARGB(202, 248, 226, 253),
        secondary: const Color.fromARGB(255, 82, 3, 96),
        primaryContainer: Colors.deepPurple,
        seedColor: const Color.fromARGB(202, 248, 226, 253)),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Regular',
          color: Color.fromARGB(213, 0, 0, 0)),
      bodyMedium: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Regular',
          color: Color.fromARGB(213, 0, 0, 0)),
      titleLarge: TextStyle(
          fontSize: 19.5,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Bold',
          color: Color.fromARGB(213, 0, 0, 0)),
    ));
