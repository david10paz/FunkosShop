import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/carro/carro.dart';
import 'package:flutter_zapatillas/pantallas/iniciar_sesion/pantalla_sesion.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaDetalladaProducto/pantalla_detallada_producto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zapatillas/pantallas/registrarse_completar/listaProvincias.dart';

import '../../listaProductos/productos.dart';
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

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  String provincia;

  @override
  void initState() {
    super.initState();
    productsLista;
    productsCarrito;
  }

  //Firebase ELIMINAR1
  Future<void> eliminarUsuarioAuth() async {
    auth.currentUser.delete();
  }

  //Firebase ELIMINAR2
  Future<void> eliminarUsuarioCol() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection("Usuarios");
    String uid = auth.currentUser.uid.toString();
    users.doc(uid).delete();
  }

  //Firebase ACTUALIZAR
  Future<void> actualizarUsuario(String nombre, String direccion, String numero, String provincia) async {
    CollectionReference users = FirebaseFirestore.instance.collection("Usuarios");
    String uid = auth.currentUser.uid.toString();
    String email = auth.currentUser.email.toString();
    users
        .doc(uid)
        .update({
          'uid': uid,
          'email': email,
          'nombre': nombre,
          'direccion': direccion,
          'telefono': numero,
          'provincia': provincia
        })
        .then((value) => print("Usuario modificado correctamente"))
        .catchError((error) => print("ERROR"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            FirebaseAuth.instance.currentUser.email.toString(),
            style: TextStyle(fontSize: 14, fontFamily: 'Marker'),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 25,
                    ),
                  ],
                ),
                onTap: () {
                  dialogoModificarDatos(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      size: 25,
                    ),
                  ],
                ),
                onTap: () {
                  dialogoEliminarUsuario(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
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
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Marker'),
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
      itemBuilder: (context, index) {
        final String imagen = productsLista[index].imagen;
        var item = productsLista[index];
        item.cantidad = 1;

        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaDetalladaProductos(
                    producto: item,
                  ),
                )),
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(18)),
                        child:
                            new Image.asset("assets/images/productos/$imagen")),
                    Text(
                      item.titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Marker',
                          color: item.color),
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
                              fontSize: 18.0,
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
  
  dialogoModificarDatos(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                title: Text(
                  'Editar Datos Usuario',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Marker', color: Colors.indigo),
                ),
                content: Container(
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        controller: _nombreController,
                        decoration: InputDecoration(hintText: 'Nombre'),
                      ),
                      TextField(
                        controller: _direccionController,
                        decoration: InputDecoration(hintText: 'Dirección'),
                      ),
                      TextField(
                        controller: _numeroController,
                        decoration: InputDecoration(hintText: 'Número de teléfono'),
                        keyboardType: TextInputType.number,
                      ),
                      DropdownButton(
                        hint: Text("Seleccione su Provincia"),
                        isExpanded: true,
                        value: provincia,
                        onChanged: (newvalue) {
                          setState(() {
                            provincia = newvalue;
                          });
                        },
                        items: listaProvincias.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem,
                            style: TextStyle(color: Colors.indigo),),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      submitActionActualizarUsuario(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Actualizar',
                      style:
                          TextStyle(fontFamily: 'Marker', color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        fontFamily: 'Marker',
                      ),
                    ),
                  ),
                  Text(
                    "*Todos los campos son obligatorios",
                    style: TextStyle(fontSize: 10, fontFamily: 'Marker'),
                  )
                ],
              ),
            ],
          );
        });
  }

  dialogoEliminarUsuario(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                title: Text(
                  'Eliminar cuenta del Usuario',
                  style: TextStyle(
                    fontFamily: 'Marker',
                    color: Colors.indigo,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        fontFamily: 'Marker',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      dialogoConfirmarEliminarUsuario(context);
                    },
                    child: Text(
                      'Eliminar',
                      style: TextStyle(fontFamily: 'Marker', color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  dialogoConfirmarEliminarUsuario(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                title: Text(
                  '¿Estás seguro? PERDERAS TODOS LOS DATOS DEL USUARIO.',
                  style: TextStyle(fontFamily: 'Marker', color: Colors.indigo),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      eliminarUsuarioCol();
                      eliminarUsuarioAuth();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PantallaSesion.rutaNombre,
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      'Confirmar',
                      style: TextStyle(
                          fontFamily: 'Marker',
                          fontSize: 18,
                          color: Colors.red[900]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  )
                ],
              ),
            ],
          );
        });
  }

  submitActionActualizarUsuario(BuildContext context) {
    actualizarUsuario(_nombreController.text, _direccionController.text, _numeroController.text, provincia.trim());
  }
}
