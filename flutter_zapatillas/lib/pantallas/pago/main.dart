import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/pago/pantalla_pago.dart';

class PantallaPagoPrincipal extends StatelessWidget {
  static String rutaNombre = "/pago";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGOOO!!',
            style: new TextStyle(
                fontFamily: 'Marker',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: PantallaPago()
    );
  }
}