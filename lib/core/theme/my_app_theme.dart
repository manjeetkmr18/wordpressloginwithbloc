import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color headingTextColor = Color(0xff125eaa);
  static Color inputHintTextColor = Colors.grey.shade500;
  static Color buttonTextColor = Colors.white;
  static Color buttonBackGroundColor = Color(0xff0E4A86);
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.blueGrey.shade900;

  static TextStyle bottomTextStyle = TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700,
      fontSize: 13);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: buttonBackGroundColor,
      accentColor: buttonBackGroundColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ),
       textTheme:GoogleFonts.latoTextTheme(Theme.of(context).textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodyText1),),);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: buttonBackGroundColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));
}
