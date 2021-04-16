import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/registrarse/componentes/formulario_registro.dart';

import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProporcionalPantallaAncho(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.pantallaAltura * 0.04),
                Text("Nueva cuenta", style: cabeceraStyle),
                Text(
                  "Completa detenidamente cada \ncampo solicitado.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.pantallaAltura * 0.08),
                FormularioRegistar(),
                SizedBox(height: getProporcionalPantallaAlto(20)),
                Text(
                  'A continuación proseguiremos con la introducción \nde sus datos personales.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}