import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../iniciar_sesion/pantalla_sesion.dart';
import '../principal/listaProductos/productos.dart';
import 'body.dart';

class CreditCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
          title: Text("¡PAGO!", textAlign: TextAlign.center),
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
        body:Body(),
      );
  }
}