import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design/config_tam.dart';

class ErrorFormulario extends StatelessWidget {
  const ErrorFormulario({
    Key key,
    @required this.errores,
  }) : super(key: key);

  final List<String> errores;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errores.length, (index) => formularioErrorTexto(error: errores[index]),
        ),
    );
  }

  Row formularioErrorTexto({String error}) {
    return Row(children: [
        SvgPicture.asset(
          "assets/icons/Error.svg", 
          height: getProporcionalPantallaAlto(29),
          width: getProporcionalPantallaAncho(14)
        ),
        SizedBox(width: getProporcionalPantallaAncho(10)),
        Text(error),
      ],);
  }
}

