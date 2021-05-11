import 'package:flutter/material.dart';
import 'pantallas/db/db.dart';
import 'design/theme.dart';
import 'rutas.dart';

void main() {
  runApp(MyApp());
}

//Dart principal que establece el tema, señalando todas sus rutas, estableciendo predefinida
//la inicial la cual dan paso tanto a su vez a la primera ventana como a la inicialización de Firebase .

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
