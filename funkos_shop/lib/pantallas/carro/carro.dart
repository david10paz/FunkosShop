import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../design/constantes.dart';
import '../principal/productos.dart';
import '../principal/pantallas/vistaPrincipalProductos/pantalla_principal_productos.dart';
import '../resumen/resumen_pedido.dart';

import '../../componentes/boton.dart';
import '../../design/config_tam.dart';

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
  FirebaseAuth auth = FirebaseAuth.instance;

  Container pagoTotal(List<Productos> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 90),
      decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(18)),
      height: 70,
      width: 300,
      child: Row(
        children: <Widget>[
          Text("Total:  ${valorTotal(_cart)} €",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Marker',
                  fontSize: 18.0,
                  color: Colors.white)),
        ],
      ),
    );
  }

  String valorTotal(List<Productos> listaProductos) {
    double precioProd = 0.0;
    double gastosEnvio = 3.90;

    for (int i = 0; i < listaProductos.length; i++) {
      precioProd =
          precioProd + listaProductos[i].precio * listaProductos[i].cantidad;
    }
    double total = precioProd + gastosEnvio;
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
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
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
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10),
                                      child: Text(
                                          item.titulo +
                                              "\n" +
                                              item.precio.toString() +
                                              " €",
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            fontFamily: 'Marker',
                                            color: item.color,
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          margin: EdgeInsets.only(
                                              top: 20.0, left: 20),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  _removeCantidadProducto(
                                                      index);
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
                                                  _addCantidadProducto(index);
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
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 10),
                                  child: Column(children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove_shopping_cart,
                                          size: 28),
                                      onPressed: () {
                                        _quitarProducto(index);
                                        valorTotal(_cart);
                                        if (productsCarrito.isEmpty) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PantallaPrincipalProductos(),
                                            ),
                                          );
                                        }
                                      },
                                      color: Colors.red,
                                    ),
                                  ]),
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
                height: getProporcionalPantallaAlto(20),
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Text("Gastos de envio ya incluidos: 3,90 €",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marker',
                      fontSize: 14.0,
                      color: Colors.black)),
              Container(
                height: 100,
                width: 350,
                padding: EdgeInsets.only(top: 50),
                child: Boton(
                  texto: "Continuar con el pago",
                  pulsar: () => {
                    comprobarExistenciaDatosUsuario(),
                  },
                ),
              ),
              SizedBox(
                height: getProporcionalPantallaAlto(30),
              ),
            ],
          ))),
    );
  }

  _addCantidadProducto(int index) {
    setState(() {
      _cart[index].cantidad++;
    });
  }

  _removeCantidadProducto(int index) {
    setState(() {
      if (_cart[index].cantidad > 1) {
        _cart[index].cantidad--;
      }
    });
  }

  _quitarProducto(int index) {
    setState(() {
      _cart[index].cantidad = 1;
      _cart.remove(productsCarrito[index]);
    });
  }

  //Firebase comprobación de que existen datos del usuario
  Future<void> comprobarExistenciaDatosUsuario() async {
    String uid = auth.currentUser.uid.toString();
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).get();
    if (ds.exists) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResumenPedido(),
        ),
      );
    } else {
      mensajeRecordarRellenarCampos(context);
    }
  }

  mensajeRecordarRellenarCampos(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hemos detectado un problema',
                style: TextStyle(
                    fontFamily: 'Marker', color: Colors.red, fontSize: 20)),
            content: Text(
                "Edita tus datos personales presionando en el icono con forma de 'LÁPIZ' situado en el menú superior de la vista de los productos, si no... \n¡No podrás realizar tu compra!.",
                style: TextStyle(
                  fontFamily: 'Marker',

                ),),
          );
        });
  }
}
