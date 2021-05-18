import 'package:flutter/material.dart';
import 'componentes/body.dart';

class PantallaSesion extends StatelessWidget {
  static String rutaNombre = "/iniciar_sesion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("INICIAR SESIÓN", textAlign: TextAlign.center)),
        body: Body());
  }
}
