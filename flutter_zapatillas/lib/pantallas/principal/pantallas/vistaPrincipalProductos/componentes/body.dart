import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/config_tam.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaDetalladaProducto/pantalla_detallada_producto.dart';

import 'aspecto_productos.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        SizedBox(height: getProporcionalPantallaAlto(15)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                itemCount: productos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => AspectoProducto(
                      producto: productos[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaDetalladaProductos(
                              producto: productos[index],
                            ),
                          )
                      ),
                  )
              ),
          ),
        ),
      ],
    );
  }
}