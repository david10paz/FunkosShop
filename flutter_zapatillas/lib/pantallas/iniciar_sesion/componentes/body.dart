import 'package:flutter/material.dart';
import '../../../componentes/no_registrado.dart';
import '../../../design/config_tam.dart';

import 'formulario_iniciar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProporcionalPantallaAncho(18)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProporcionalPantallaAlto(25)),
              Text(
                "¡BIENVENIDO!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProporcionalPantallaAncho(30),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Marker'),
              ),
              SizedBox(
                height: getProporcionalPantallaAlto(10),
              ),
              Text(
                "Introduce tu usuario y contraseña \npara poder acceder a tu cuenta",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProporcionalPantallaAlto(20),
              ),
              FormularioIniciar(),
              NoRegistrado()
            ],
          ),
        ),
      ),
    ));
  }
}
