import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor=Color(0xff5D9CEC);
  static Color bgColor=Color(0xffDFECDB);
  static ThemeData light = ThemeData(
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: Colors.black
    ),
      bodySmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xff5D9CEC)
      )
    ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xff5D9CEC),
        showSelectedLabels: false,
        showUnselectedLabels: false,

      ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: primaryColor,
      iconSize: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.white, width: 4)),
    elevation: 0
    ),
    iconTheme: IconThemeData(
        size: 30,

    ),




  );
  static Color primaryDarkColor=Colors.black;
  static Color bgDarkColor=Color(0xff060E1E);
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDarkColor,
        onPrimary: Colors.white,
        secondary: primaryColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: primaryDarkColor,
        surface: Colors.white,
        onSurface: Colors.white),
    textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white
        ),
        bodySmall: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: primaryColor
        )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: Colors.black
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,

    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      color: Color(0xff141922),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        iconSize: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.black, width: 4)),
        elevation: 0
    ),
    iconTheme: IconThemeData(
      size: 30,

    ),




  );
}
