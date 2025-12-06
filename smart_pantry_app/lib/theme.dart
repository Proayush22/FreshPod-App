import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF34C759),
      scaffoldBackgroundColor: const Color(0xFFF2F2F7),
      textTheme: GoogleFonts.manropeTextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFF34C759),
      scaffoldBackgroundColor: const Color(0xFF000000),
      textTheme: GoogleFonts.manropeTextTheme(),
      cardColor: const Color(0xFF1C1C1E),
    );
  }
}
