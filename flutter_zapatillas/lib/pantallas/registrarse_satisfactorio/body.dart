import 'package:flutter/material.dart';
import '../../componentes/boton.dart';
import '../iniciar_sesion/pantalla_sesion.dart';

import '../../design/config_tam.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: getProporcionalPantallaAncho(20)),
            Image(
              image: AssetImage('assets/images/login_satisfactorio.png'),
              height: SizeConfig.pantallaAltura * 0.4,
            ),
            SizedBox(height: SizeConfig.pantallaAltura * 0.08),
            Text(
              "¡Registro Completado!",
              style: TextStyle(
                fontSize: getProporcionalPantallaAncho(30),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            SizedBox(
              width: SizeConfig.pantallaAncho * 0.6,
              child: Boton(
                texto: "Login",
                pulsar: () {
                  Navigator.pushNamed(context, PantallaSesion.rutaNombre);
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
