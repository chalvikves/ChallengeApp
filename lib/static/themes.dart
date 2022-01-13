import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.light : ThemeMode.dark;

  void toogleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        headline4: GoogleFonts.jost(fontSize: 32, color: Colors.black),
        bodyText2: GoogleFonts.jost(fontSize: 16, color: Colors.black),
        bodyText1: GoogleFonts.jost(fontSize: 14, color: Colors.black),
        headline5: GoogleFonts.jost(fontSize: 24, color: Colors.black),
        headline6: GoogleFonts.jost(fontSize: 14, color: Colors.grey),
      ),
      hintColor: Colors.grey[350],
      focusColor: const Color(0xFF111111),
      buttonColor: Colors.grey[200],
      cardColor: const Color(0xFF111111),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF111111),
      backgroundColor: const Color(0xFF222222),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        headline4: GoogleFonts.jost(fontSize: 32, color: Colors.white),
        bodyText2: GoogleFonts.jost(fontSize: 16, color: Colors.white),
        bodyText1: GoogleFonts.jost(fontSize: 14, color: Colors.white),
        headline5: GoogleFonts.jost(fontSize: 24, color: Colors.white),
        headline6: GoogleFonts.jost(fontSize: 14, color: Colors.grey),
      ),
      hintColor: Colors.grey[700],
      focusColor: Colors.white,
      buttonColor: Colors.grey[350],
      cardColor: const Color(0x88010101),
    );
  }
}
