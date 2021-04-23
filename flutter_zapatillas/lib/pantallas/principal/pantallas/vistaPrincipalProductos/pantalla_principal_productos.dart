import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/carro/body.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaDetalladaProducto/pantalla_detallada_producto.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../listaProductos/productos.dart';


class PantallaPrincipalProductos extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  FirebaseAuth auth = FirebaseAuth.instance;

    @override
    void initState() {
      super.initState();
      productsLista;
      productsCarrito;
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Usuario: " + FirebaseAuth.instance.currentUser.email.toString(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Marker'
            ),),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 40,
                    ),
                    if (productsCarrito.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            productsCarrito.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'Marker'),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (productsCarrito.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(productsCarrito),
                      ),
                    );
                },
              ),
            )
          ],
        ),
        body: _cuadroProductos()
      );
    }
  
  
  
  
    GridView _cuadroProductos() {
      return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: productsLista.length,
        
        itemBuilder: (context, index){
          final String imagen = productsLista[index].imagen;
          var item = productsLista[index];
          
          return GestureDetector(
              onTap: () => Navigator.push(context,MaterialPageRoute(
                    builder: (context) => PantallaDetalladaProductos(
                    producto:item,
                    ),
                  )
                ),
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(18)),
                        child:new Image.asset("assets/images/productos/$imagen")
                      ),
                      Text(
                        item.titulo,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 21.0, fontFamily: 'Marker', color: item.color),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            item.precio.toString() + " €",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                fontFamily: 'Marker',
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15.0,
                              bottom: 15.0,
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                child: (!productsCarrito.contains(item))
                                    ? Icon(
                                        Icons.shopping_cart,
                                        color: Colors.green,
                                        size: 40,
                                      )
                                    : Icon(
                                        Icons.shopping_cart,
                                        color: Colors.red,
                                        size: 38,
                                      ),
                                onTap: () {
                                  setState(() {
                                    if (!productsCarrito.contains(item))
                                      productsCarrito.add(item);
                                    else
                                      productsCarrito.remove(item);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            );
        },
      );
    }

  }