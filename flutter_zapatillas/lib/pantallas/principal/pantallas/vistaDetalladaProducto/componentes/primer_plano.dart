import 'package:flutter/material.dart';
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
            "FUNKOS SHOP",
            style: TextStyle(
              fontFamily: 'Marker',
              color: Colors.white,
              fontSize: 15
              ),
          ),
          Text(
            producto.titulo,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Marker'),
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "PRECIO: \n", style: TextStyle(fontFamily: 'Marker')),
                    TextSpan(
                      text: "${producto.precio} €",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Marker', fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 120),
              Expanded(
                child: 
                Container(
                  height: 170,
                  child: Hero(
                  tag: "${producto.id}",
                  child: Image.asset(
                    "assets/images/productos/${producto.imagen}",
                    fit: BoxFit.fill,
                  ),
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