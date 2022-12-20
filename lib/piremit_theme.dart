import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piremit_app/utils/designs/colors.dart';

class PiremitTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.titilliumWeb(
      fontSize: 22.0, fontWeight: FontWeight.w600, color: kPrimaryColor
    ),
    headline1: GoogleFonts.titilliumWeb(
      fontSize: 45.0, fontWeight: FontWeight.w600, color: kTextColor
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: kTextColor
    ),
    headline4: GoogleFonts.poppins(
        fontSize: 17.0, fontWeight: FontWeight.w400, color: kTextColor
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
      bodyText1: GoogleFonts.titilliumWeb(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: kPrimaryColor
      ),
      headline1: GoogleFonts.titilliumWeb(
          fontSize: 45.0, fontWeight: FontWeight.w600, color: kPrimaryColor
      ),
      headline2: GoogleFonts.poppins(
          fontSize: 12.0, fontWeight: FontWeight.w400, color: kTextColor
      ),
      headline3: GoogleFonts.poppins(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: kTextColor
      )
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black, backgroundColor: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Colors.black),
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.green),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Colors.green),
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.green),
      textTheme: darkTextTheme,
    );
  }
}