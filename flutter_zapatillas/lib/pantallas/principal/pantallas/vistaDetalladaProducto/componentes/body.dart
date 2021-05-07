import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';

import 'primer_plano.dart';

class Body extends StatelessWidget {
  final Productos producto;

  const Body({Key key, this.producto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.25),
                  height: 400,
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      marcaTamano(context),
                      SizedBox(height: 10),
                      descripcion(context),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                PrimerPlano(producto: producto)
              ],
            ),
          )
        ],
      ),
    );
  }

  marcaTamano(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: colorPrincipal),
              children: [
                TextSpan(text: "MARCA\n", style: TextStyle(fontSize: 12, fontFamily: 'Marker')),
                TextSpan(
                  text: "${producto.coleccion} ",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Marker', color: Colors.indigo),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: colorPrincipal),
              children: [
                TextSpan(text: "Tamaño\n",  style: TextStyle(fontSize: 12, fontFamily: 'Marker')),
                TextSpan(
                  text: "${producto.tamano} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold ,fontSize: 20, fontFamily: 'Marker', color: Colors.indigo),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  descripcion(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        producto.descripcion,
        style: TextStyle(height: 1.5, fontFamily: 'Marker'),
      ),
    );
  }
}