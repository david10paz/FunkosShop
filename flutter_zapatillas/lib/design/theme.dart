import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constantes.dart';

//Temas

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.indigo,
    fontFamily: "Marker",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: Colors.white),
  gapPadding: 20,
);

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: colorPrincipal,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline5: TextStyle(color: Colors.grey),
    ),
  );
}
