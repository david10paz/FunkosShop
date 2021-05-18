import 'package:flutter/material.dart';

import 'componentes/body.dart';

class PantallaRegistrarse extends StatelessWidget {
  static String rutaNombre = "/registrarse";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRARSE"),
      ),
      body: Body(),
    );
  }
}
