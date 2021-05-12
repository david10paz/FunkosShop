import 'package:flutter/material.dart';
import 'body.dart';

class PantallaRegistrarseSatisfactorio extends StatelessWidget {
  static String rutaNombre = "/registrarse_satisfactorio";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Registro Satisfactorio"),
        automaticallyImplyLeading: false
      ),
      body:Body(),
    );
  }
}