import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'SfPro',
        primaryColor: const Color(0xFF152B47),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFF9F3F0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color(0xFF393835),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        textTheme: const TextTheme(),
      );
}
