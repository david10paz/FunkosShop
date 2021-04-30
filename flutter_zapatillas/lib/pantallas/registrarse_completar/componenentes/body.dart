import 'package:flutter/material.dart';

import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';
import 'formulario_registrar_completar.dart';

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
                SizedBox(height: SizeConfig.pantallaAltura * 0.15),
                Text("Completa tu perfil", style: cabeceraStyle),
                Text(
                  "Completa detenidamente cada campo \npersonal solicitado.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.pantallaAltura * 0.06),
                FormularioRegistrarCompletar(),
                SizedBox(height: getProporcionalPantallaAlto(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
