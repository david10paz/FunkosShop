import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/iniciar_sesion/pantalla_sesion.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';

import 'listaProductos/productos.dart';



class PantallaPrincipal extends StatelessWidget {
  static String rutaNombre = "/principal";
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        title: Text("¡BIENVENIDO!", textAlign: TextAlign.center),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:GestureDetector( 
                onTap: () async {
                productsCarrito.clear();
                 Navigator.of(context).pushNamedAndRemoveUntil(PantallaSesion.rutaNombre, (Route<dynamic> route) => false);
                 await FirebaseAuth.instance.signOut();
              }, 
              child: Icon(Icons.logout, size:38 )) ,
              ),
            ],
        
        leading: SizedBox(),
      ),
      body:PantallaPrincipalProductos(),
    ),
    onWillPop: () => showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('¡ESPERA!',
        style: TextStyle(
          color: Colors.indigo
        ),),
        content: Text('Realmente quieres salir de la aplicación'),
        actions: [
          TextButton(
            child: Text('SI',
            style: TextStyle(
              color: Colors.red
            ),),
            onPressed: () async {
              productsCarrito.clear();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(PantallaSesion.rutaNombre, (Route<dynamic> route) => false);
            }
          ),
          TextButton(
            child: Text('NO'),
            onPressed: () => 
            Navigator.pop(c, false),
          ),
        ],
      ),
    ),
    );
  }
}