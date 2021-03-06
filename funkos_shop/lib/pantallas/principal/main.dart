import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../iniciar_sesion/pantalla_sesion.dart';
import 'pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';

import 'productos.dart';

class PantallaPrincipal extends StatelessWidget {
  static String rutaNombre = "/principal";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("¡BIENVENIDO!", textAlign: TextAlign.center),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () async {
                    mensajeConfirmarLogout(context);
                  },
                  child: Icon(Icons.logout, size: 38)),
            ),
          ],
          leading: SizedBox(),
        ),
        body: PantallaPrincipalProductos(),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text(
            '¡ESPERA!',
            style: TextStyle(color: Colors.indigo),
          ),
          content: Text('Realmente, ¿Quieres salir de la aplicación?'),
          actions: [
            TextButton(
                child: Text(
                  'SI',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () async {
                  productsCarrito.clear();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PantallaSesion.rutaNombre,
                      (Route<dynamic> route) => false);
                }),
            TextButton(
              child: Text('NO'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }

  mensajeConfirmarLogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '¿Quieres salir de la aplicación?',
              style: TextStyle(
                  fontFamily: 'Marker', color: Colors.indigo, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  productsCarrito.clear();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PantallaSesion.rutaNombre,
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  'SI',
                  style: TextStyle(fontFamily: 'Marker', color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'NO',
                  style: TextStyle(
                    fontFamily: 'Marker',
                  ),
                ),
              ),
            ],
          );
        });
  }
}
