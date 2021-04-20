import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';


class AspectoProducto extends StatelessWidget {
  final Productos producto;
  final Function press;
  const AspectoProducto({
    Key key,
    this.producto,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: producto.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${producto.id}",
                child: Image.asset(producto.imagen),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              producto.titulo,
              style: TextStyle(color: colorSecundario),
            ),
          ),
          Text(
            "\$${producto.precio}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
