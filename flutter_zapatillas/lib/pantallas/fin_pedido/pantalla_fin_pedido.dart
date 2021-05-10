import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../iniciar_sesion/pantalla_sesion.dart';
import '../principal/listaProductos/productos.dart';
import '../principal/main.dart';
import 'body.dart';

class PantallaFinPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
      child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Compra realizada"),
        automaticallyImplyLeading: false
      ),
      body:Body(),
    ),
    onWillPop: () => showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('¡Enhorabuena por tu compra!',
        style: TextStyle(
          color: Colors.indigo
        ),),
        content: Text('¿Ahora qué hacemos?'),
        actions: [
          TextButton(
            child: Text('Salir App',
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
            child: Text('Menu Principal'),
            onPressed: () {
             productsCarrito.clear();
             Navigator.pushNamed(context, PantallaPrincipal.rutaNombre);
            }
          ),
        ],
      ),
    ),
    );
  }
}