import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../design/config_tam.dart';
import '../../design/constantes.dart';
import '../../pantallas/registrarse_completar/listaProvincias.dart';
import '../pago/pantalla_pago.dart';

class ResumenPedido extends StatefulWidget {
  @override
  _ResumenPedidoState createState() => _ResumenPedidoState();
}

class _ResumenPedidoState extends State<ResumenPedido> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _direccionController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  String provincia;

  @override
  void initState() {
    super.initState();
    provincia = "Madrid";
  }

  //Firebase ACTUALIZAR - Actualizamos los datos del usuario registrado
  Future<void> actualizarUsuario(String direccion, String numero, String provincia) async {
    CollectionReference users = FirebaseFirestore.instance.collection("Usuarios");
    String uid = auth.currentUser.uid.toString();
    users
        .doc(uid)
        .update({
          'direccion': direccion,
          'telefono': numero,
          'provincia': provincia
        })
        .then((value) => print("Usuario modificado correctamente"))
        .catchError((error) => print("ERROR"));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Usuarios');
    String documentId = FirebaseAuth.instance.currentUser.uid.toString();
    return Scaffold(
      body: Container(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(documentId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return Scaffold(
                appBar: AppBar(
                  title: Text('Resumen de Pedido',
                      style: new TextStyle(
                          fontFamily: 'Marker',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white)),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.indigo,
                ),
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: getProporcionalPantallaAlto(40)),
                      Text("Antes de terminar ${data['nombre']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 22,
                            color: colorPrincipal,
                          )),
                      SizedBox(height: getProporcionalPantallaAlto(30)),
                      Text("QUIERES CONTINUAR CON ESTOS DATOS?\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Marker',
                              fontSize: 22,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline)),
                      Text(
                          "Teléfono: ${data['telefono']} \n Dirección: ${data['direccion']} \n Provincia: ${data['provincia']}\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 20,
                            color: Colors.indigo,
                          )),
                      SizedBox(height: getProporcionalPantallaAlto(20)),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: colorPrincipal),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Realizar Pago',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Marker'),
                          ),
                        ),
                        onPressed: () {
                          dialogoConfirmar(context);
                        },
                      ),
                      SizedBox(height: getProporcionalPantallaAlto(20)),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.blue[50]),
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            child: SvgPicture.asset("assets/icons/edit.svg")),
                        onPressed: () {
                          dialogoModificarDatos(context);
                        },
                      ),
                    ]),
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

  dialogoModificarDatos(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Editar Datos Usuario',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Marker', color: Colors.indigo),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        controller: _direccionController,
                        decoration: InputDecoration(hintText: 'Dirección'),
                      ),
                      TextField(
                        controller: _numeroController,
                        decoration:
                            InputDecoration(hintText: 'Número de teléfono'),
                        keyboardType: TextInputType.number,
                      ),
                      DropdownButton(
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
                            child: Text(
                              valueItem,
                              style: TextStyle(color: Colors.indigo),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  mensajeConfirmarDatosActualizados(context);
                },
                child: Text(
                  'Actualizar',
                  style: TextStyle(fontFamily: 'Marker', color: Colors.green),
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
          );
        });
  }

  dialogoConfirmar(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '¿Confirmas?',
              style: TextStyle(fontFamily: 'Marker'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(fontFamily: 'Marker'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreditCardPage()),
                  );
                },
                child: Text(
                  'Proceder',
                  style: TextStyle(
                      color: Colors.green, fontFamily: 'Marker', fontSize: 16),
                ),
              ),
            ],
          );
        });
  }

  mensajeDatosActualizados(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editados los campos introducidos.',
                style: TextStyle(fontFamily: 'Marker', color: Colors.indigo)),
          );
        });
  }

  mensajeConfirmarDatosActualizados(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '¿Confirmas estos datos?',
              style: TextStyle(fontFamily: 'Marker', color: Colors.indigo),
            ),
            content: Text(
              ' Dirección: ${_direccionController.value.text.toString()}\n Teléfono: ${_numeroController.value.text.toString()}\n Provincia: ${provincia.trim()}.',
              style: TextStyle(
                fontFamily: 'Marker',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontFamily: 'Marker',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  submitAction(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreditCardPage()),
                  );
                  mensajeDatosActualizados(context);
                },
                child: Text(
                  'Si',
                  style: TextStyle(fontFamily: 'Marker', color: Colors.green),
                ),
              ),
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    actualizarUsuario(
        _direccionController.text, _numeroController.text, provincia.trim());
  }
}
