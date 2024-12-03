import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,

    primaryColor: Color(0xFF1B5E37),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.cairo(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.cairo(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}