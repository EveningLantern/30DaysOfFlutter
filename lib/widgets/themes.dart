import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Color(0xff6C63FF),
        secondaryHeaderColor: deepvioletColor,
        cardColor: Colors.white,
        canvasColor: creamColor,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primaryColorDark: deepvioletColor,
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 209, 207, 248),
        secondaryHeaderColor: Colors.white,
        cardColor: Colors.black,
        canvasColor: antiCreamColor,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
      );
  // Colors
  static const Color softvioletColor = Color(0xff6C63FF);
  static const Color creamColor = Color(0xfff5f5f5);
  static const Color deepvioletColor = Color.fromARGB(255, 36, 33, 84);
  static const Color lightBluishColor = Vx.purple400;
  static const Color antiCreamColor = Vx.gray900;
}
