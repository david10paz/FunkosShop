import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';


class Descripcion extends StatelessWidget {
  const Descripcion({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        producto.descripcion,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}