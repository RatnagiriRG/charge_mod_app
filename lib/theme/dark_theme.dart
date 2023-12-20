import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
          color: Color.fromRGBO(235, 235, 235, 1),
          fontSize: 12,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.poppins(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.poppins(
          color: Color.fromRGBO(235, 235, 235, 1),
          fontSize: 12,
          fontWeight: FontWeight.w600),
      displayMedium: GoogleFonts.aBeeZee(
        color: Color.fromRGBO(235, 235, 235, 1),
        fontSize: 14,
      ),
      titleMedium: GoogleFonts.aBeeZee(
          color: Color.fromRGBO(83, 75, 74, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      titleSmall: GoogleFonts.poppins(
          color: Color.fromRGBO(83, 75, 74, 1),
          fontSize: 12,
          fontWeight: FontWeight.w500)),
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
      onTertiary: Color.fromRGBO(235, 235, 235, 1),
      onPrimaryContainer: Color.fromRGBO(235, 235, 235, 1),
      background: Color.fromRGBO(46, 46, 45, 1),
      onBackground: Color.fromRGBO(102, 103, 102, 1),
      onSecondary: Color.fromRGBO(230, 116, 12, 1)),
);
