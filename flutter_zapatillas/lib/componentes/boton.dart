import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../design/config_tam.dart';
import '../design/constantes.dart';

class Boton extends StatelessWidget {
  const Boton({
    Key key, this.texto, this.pulsar,
  }) : super(key: key);
  final String texto;
  final Function pulsar;

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProporcionalPantallaAlto(50),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: colorPrincipal
        ),
        onPressed: pulsar, 
        child: Text(
          texto, 
          style: TextStyle(
            fontSize: getProporcionalPantallaAncho(18),
            color: Colors.white,
            fontFamily: 'Marker'
            ),
          ),
      ),
    );
  }
}