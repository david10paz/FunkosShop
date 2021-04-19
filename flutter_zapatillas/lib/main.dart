import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/db/db.dart';
import 'design/theme.dart';
import 'rutas.dart';

void main() {
  runApp(MyApp());
}

//Dart principal que establece el tema, sus rutas y la inicial.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bambas Shop',
      theme: theme(),
      initialRoute: FirebaseInitial.rutaNombre,
      routes: rutas,
    );
  }
}

