import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaDetalladaProducto/componentes/anadir_carrito.dart';


import 'marca_tamano.dart';
import 'descripcion.dart';
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
                  margin: EdgeInsets.only(top: size.height * 0.26),
                  height: 450,
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
                      MarcaTamano(producto: producto),
                      SizedBox(height: 10),
                      Descripcion(producto: producto),
                      SizedBox(height: 10),
                      //AnadirCarrito()
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
}