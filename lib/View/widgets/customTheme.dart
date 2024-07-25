// ignore: file_names
import 'package:flutter/material.dart';

final customTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.purple),
    colorScheme: ColorScheme.fromSeed(
        primary: Colors.white, //const Color(0xC9F8E2FD),
        secondary: Colors.deepPurple, //const Color.fromARGB(255, 82, 3, 96),
        seedColor: const Color.fromARGB(202, 248, 226, 253)),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Regular',
          color: Color.fromARGB(179, 0, 0, 0)),
      bodyMedium: TextStyle(
          fontSize: 12.7,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Regular',
          color: Color.fromARGB(142, 0, 0, 0)),
      bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Regular',
          color: Color.fromARGB(157, 0, 0, 0)),
      titleLarge: TextStyle(
          fontSize: 19.5,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Bold',
          color: Color.fromARGB(191, 36, 36, 36)),
    ));
