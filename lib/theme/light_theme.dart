import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
 displayLarge: GoogleFonts.poppins(
          color: Color.fromRGBO(46, 46, 45, 1),
          fontSize: 12,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.poppins(
          color: Color.fromRGBO(46, 46, 45, 1),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.poppins(
          color: Color.fromRGBO(46, 46, 45, 1),
          fontSize: 12,
          fontWeight: FontWeight.w500),
      displayMedium: GoogleFonts.aBeeZee(
        color: Color.fromRGBO(46, 46, 45, 1),
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
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
      onTertiary: Color.fromRGBO(46, 46, 45, 1),
      background: Color.fromRGBO(255, 255, 255, 1),
      onBackground: Color.fromRGBO(235, 235, 235, 1),
      onSecondary: Color.fromRGBO(230, 116, 12, 1)),
);
