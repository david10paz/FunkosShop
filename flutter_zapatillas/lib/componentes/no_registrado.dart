import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/registrarse/pantalla_registrarse.dart';

import '../design/config_tam.dart';
import '../design/constantes.dart';

class NoRegistrado extends StatelessWidget {
  const NoRegistrado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No estás registrado?  ",
          style: TextStyle(
            fontSize: getProporcionalPantallaAncho(16)
          ),
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, PantallaRegistrarse.rutaNombre),
            child: Text(
            "REGÍSTRATE",
            style: TextStyle(
              fontSize: getProporcionalPantallaAncho(18),
              color: colorPrincipal,
            ),
          ),
        ),
      ],
    );
  }
}