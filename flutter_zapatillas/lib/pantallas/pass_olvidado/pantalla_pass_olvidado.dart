import 'package:flutter/material.dart';
import 'body.dart';

class PantallaPassOlvidado extends StatelessWidget {
  static String rutaNombre = "/pass_olvidado";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contraseña Olvidada"),
      ),
      body: Body(),
    );
  }
}