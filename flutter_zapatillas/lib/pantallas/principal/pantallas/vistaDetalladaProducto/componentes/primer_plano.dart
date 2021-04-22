import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';

class PrimerPlano extends StatelessWidget {
  const PrimerPlano({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "BAMBAS SHOP",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            producto.titulo,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "PRECIO: \n"),
                    TextSpan(
                      text: "\$${producto.precio}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: colorPrincipal, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Hero(
                  tag: "${producto.id}",
                  child: Image.asset(
                    "assets/images/productos/${producto.imagen}",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}