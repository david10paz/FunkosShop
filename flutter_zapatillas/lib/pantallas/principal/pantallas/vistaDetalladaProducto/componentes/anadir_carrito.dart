import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zapatillas/componentes/boton.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';

class AnadirCarro extends StatelessWidget {
  const AnadirCarro({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: producto.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/carrito.svg",
                color: producto.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Boton(
                pulsar: (){
                  
                },
                texto: "AÑADIR AL CARRITO"),
            ),
          ),
        ],
      ),
    );
  }
}