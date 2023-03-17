import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppTheme currentTheme = AppTheme();

class AppTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff274233),
        tertiary: Color.fromARGB(255, 6, 44, 133),
        onPrimary: Color.fromARGB(255, 240, 235, 235),
        secondary: Color(0xff000000),
        onSecondary: Color(0xff1A1B24),
        error: Color(0xFFFFCE37),
        onError: Color(0xFFFFFFFF),
        background: Color(0xffF8F7F5),
        onBackground: Color(0xFF2A292F),
        surface: Color(0xFFFFFFFF),
        onSurface: Color.fromARGB(255, 231, 14, 14),
        outline: Color(0xff47C70B),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.mulish(
            fontSize: 75,
            fontWeight: FontWeight.w500,
            height: 1.0,
            letterSpacing: -1.5,
            color: const Color(0xFF000000)),
        displayMedium: GoogleFonts.mulish(
          fontSize: 58,
          height: 1.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.5,
          color: const Color(0xFF000000),
        ),
        displaySmall: GoogleFonts.mulish(
            fontSize: 30,
            height: 1.0,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000)),
        headlineMedium: GoogleFonts.mulish(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000),
          letterSpacing: 0.25,
        ),
        headlineSmall: GoogleFonts.mulish(
          fontSize: 20,
          height: 1.0,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF000000),
        ),
        titleLarge: GoogleFonts.mulish(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.9,
            color: const Color(0xFF000000),
            height: 1.0),
        titleMedium: GoogleFonts.mulish(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
            color: const Color(0xFF000000)),
        titleSmall: GoogleFonts.mulish(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: const Color(0xFF000000)),
        bodyLarge: GoogleFonts.mulish(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
            color: const Color(0xFF000000),
        ),
        bodyMedium: GoogleFonts.mulish(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
            color: const Color(0xFFA0A6AC),
            height: 1.5),
        labelLarge: GoogleFonts.mulish(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.25,
            height: 1.0,
            color: Color(0xff5484F5)),
        bodySmall: GoogleFonts.mulish(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: const Color(0xFF000000),
        ),
        labelSmall: GoogleFonts.mulish(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
