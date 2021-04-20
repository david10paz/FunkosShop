import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';



class PantallaPrincipal extends StatelessWidget {
  
static String rutaNombre = "/principal";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: colorPrincipal),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PantallaPrincipalProductos(),
    );
  }
}