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
      scaffoldBackgroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        headline4: GoogleFonts.jost(fontSize: 32, color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      backgroundColor: Colors.black,
      textTheme: TextTheme(
        headline4: GoogleFonts.jost(fontSize: 32, color: Colors.white),
      ),
    );
  }
}
