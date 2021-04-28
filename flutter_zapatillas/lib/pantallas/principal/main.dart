import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';

import '../intro/pantalla_intro.dart';
import 'listaProductos/productos.dart';



class PantallaPrincipal extends StatelessWidget {
  static String rutaNombre = "/principal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BIENVENIDO!", textAlign: TextAlign.center),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:GestureDetector( 
                onTap: () async {
                productsCarrito.clear();
                 Navigator.of(context).pushNamedAndRemoveUntil(PantallaIntro.rutaNombre, (Route<dynamic> route) => false);
                 await FirebaseAuth.instance.signOut();
              }, 
              child: Icon(Icons.logout, size:38 )) ,
              ),
            ],
        
        leading: SizedBox(),
      ),
      body:PantallaPrincipalProductos(),
    );
  }
}