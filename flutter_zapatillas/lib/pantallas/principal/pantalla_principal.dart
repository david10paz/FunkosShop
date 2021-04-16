import 'package:flutter/material.dart';

import 'componentes/body.dart';

class PantallaPrincipal extends StatelessWidget {
  static String rutaNombre = "/principal";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:Body(),
    );
  }
}