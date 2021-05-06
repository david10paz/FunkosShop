import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';
import 'package:flutter_zapatillas/pantallas/resumen/resumen_pedido.dart';


import '../../componentes/boton.dart';

class Cart extends StatefulWidget {
  static String rutaNombre = "/carro";
  final List<Productos> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;

  List<Productos> _cart;

  Container pagoTotal(List<Productos> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 90),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(18)),
      height: 70,
      width: 300,
      child: Row(
        children: <Widget>[
          Text("Total:  ${valorTotal(_cart)} €",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Marker',
                  fontSize: 16.0,
                  color: Colors.white))
        ],
      ),
    );
  }

  String valorTotal(List<Productos> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].precio * listaProductos[i].cantidad;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CARRO DE LA COMPRA',
            style: new TextStyle(
                fontFamily: 'Marker',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PantallaPrincipalProductos(),
                ),
              );
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollController
                  .jumpTo(_scrollController.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].imagen;
                  var item = _cart[index];
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: item.color,
                                    borderRadius: BorderRadius.circular(18)),
                                  child: new Image.asset(
                                      "assets/images/productos/$imagen",
                                      fit: BoxFit.contain),
                                ),
                                
                                Column(
                                  children: <Widget>[
                                    Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                                    child:
                                      Text(item.titulo + "\n" + item.precio.toString() + " €",
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            fontFamily: 'Marker',
                                            color: item.color,
                                        )
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: colorPrincipal,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Colors.indigo,
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              )),
                                          margin: EdgeInsets.only(top: 20.0, left: 20),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  _removeProduct(index);
                                                  valorTotal(_cart);
                                                },
                                                color: Colors.white,
                                              ),
                                              Text('${_cart[index].cantidad}',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: Colors.white)),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  _addProduct(index);
                                                  valorTotal(_cart);
                                                },
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                                  child:
                                  Column(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.remove_shopping_cart, size: 28),
                                        onPressed: () {
                                          _quitarProduct(index);
                                          valorTotal(_cart);
                                          if (productsCarrito.isEmpty){
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => PantallaPrincipalProductos(),
                                              ),
                                            );
                                          }
                                        },
                                        color: Colors.red,
                                      ),
                                    ]
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.purple,
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 400,
                padding: EdgeInsets.only(top: 50),
                child: Boton(
                  texto: "Continuar con el pago",
                  pulsar: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResumenPedido(),
                      ),
                    ),
                  },
                ),
              ),
            ],
          ))),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].cantidad++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      if(_cart[index].cantidad > 1){
          _cart[index].cantidad--;
      }
    });
  }

  _quitarProduct(int index) {
    setState(() {
      _cart[index].cantidad = 1;
      _cart.remove(productsCarrito[index]);
    });
  }
}