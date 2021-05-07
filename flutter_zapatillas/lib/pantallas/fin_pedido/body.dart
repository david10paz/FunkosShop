import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../componentes/boton.dart';
import '../../design/config_tam.dart';
import '../principal/listaProductos/productos.dart';

import '../principal/main.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Usuarios');
    String documentId = FirebaseAuth.instance.currentUser.uid.toString();
        return Scaffold(
          body:Container(  
            child:
              FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return 
              Scaffold(
                body: Container(
                  width: 500,
                  child:SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Image(
                          image: AssetImage('assets/images/pedidoRealizado.png'),
                          height: SizeConfig.pantallaAltura * 0.3,
                        ),
                        Text(
                          "¡Pedido completado ${data['nombre']}!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 24,
                            color: Colors.white,
                          )
                        ),
                        SizedBox(height: getProporcionalPantallaAlto(30)),
                        Text(
                          "Teléfono: ${data['telefono']} \n Dirección: ${data['direccion']} \n Provincia: ${data['provincia']}\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 20,
                            color: Colors.white,
                          )
                        ),
                        Text(
                          "Productos en Camino",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 20,
                            color: Colors.white,
                            decoration: TextDecoration.underline
                          )
                        ),
                        SizedBox(height: getProporcionalPantallaAlto(10)),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productsCarrito.length,
                          itemBuilder: (context, index) {
                            var item = productsCarrito[index];
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 60, top:5, bottom: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                              padding: const EdgeInsets.all(2),
                                              child:
                                                Text(item.titulo + " - " + item.precio.toString() + "€ - " + 'x ${productsCarrito[index].cantidad}',
                                                  textAlign: TextAlign.center,
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18.0,
                                                      color: Colors.white,
                                                  )
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  
                                )
                              ],
                            );
                          },
                        ),
                        SizedBox(height: getProporcionalPantallaAlto(20)),
                        SizedBox(
                          width: SizeConfig.pantallaAncho * 0.6,
                          child: Boton(
                            texto: "Volver Menú Principal",
                            pulsar: () {
                              productsCarrito.clear();
                              Navigator.pushNamed(context, PantallaPrincipal.rutaNombre);
                            },
                          ),
                        ),
                        SizedBox(height: getProporcionalPantallaAlto(20)),
                      ]
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator(
              strokeWidth: 6,
            );
          },
        ),
      ),
    );
  }
}
