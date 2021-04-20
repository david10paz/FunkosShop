import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';


class MarcaTamano extends StatelessWidget {
  const MarcaTamano({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: colorPrincipal),
              children: [
                TextSpan(text: "MARCA\n"),
                TextSpan(
                  text: "${producto.marca} ",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: colorPrincipal),
              children: [
                TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${producto.tamano} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}