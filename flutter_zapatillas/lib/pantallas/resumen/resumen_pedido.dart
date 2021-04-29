import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zapatillas/design/config_tam.dart';
import 'package:flutter_zapatillas/design/constantes.dart';
import 'package:flutter_zapatillas/pantallas/pago/pantalla_pago.dart';

class ResumenPedido extends StatelessWidget {
  final String documentId;

  ResumenPedido(this.documentId);


  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _direccionController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();

  
  //Firebase
  Future<void> actualizarUsuario(String direccion, String numero) async{
   CollectionReference users = FirebaseFirestore.instance.collection("Usuarios");
   String uid = auth.currentUser.uid.toString();
   users.doc(uid)
   .update({'direccion': direccion, 'telefono': numero})
   .then((value) => print("Usuario modificado correctamente"))
   .catchError((error) => print("ERROR"));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Usuarios');
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
                  child:SingleChildScrollView(
                        child: Column(
                          children: [ 
                            SizedBox(height: getProporcionalPantallaAlto(40)),
                            Text(
                              "Antes de terminar ${data['nombre']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Marker',
                                fontSize: 22,
                                color: colorPrincipal,
                              )
                            ),
                            SizedBox(height: getProporcionalPantallaAlto(30)),
                            Text(
                              "QUIERES CONTINUAR CON ESTOS DATOS? \n\n Dirección: ${data['direccion']} \n Teléfono: ${data['telefono']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Marker',
                                fontSize: 22,
                                color: Colors.indigo,
                              )
                            ),
                            SizedBox(height: getProporcionalPantallaAlto(20)),
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: colorPrincipal
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text(
                                  'Realizar Pago',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Marker'
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreditCardPage(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: getProporcionalPantallaAlto(20)),
                            TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.blue[50]
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child : SvgPicture.asset("assets/icons/edit.svg")
                            ),
                            onPressed: () {
                              dialogoModificarDatos(context);
                            },
                          ),
                        ]
                  ),
                ),
                ),
              );
            }
            return Text("loading");
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
            title: Text('Editar Datos del Usuario'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: _direccionController,
                    decoration: InputDecoration(hintText: 'Dirección'),
                  ),
                  TextField(
                    controller: _numeroController,
                    decoration: InputDecoration(hintText: 'Número de teléfono'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  submitAction(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResumenPedido(FirebaseAuth.instance.currentUser.uid.toString()),
                      ),
                    );
                },
                child: Text('Actualizar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    actualizarUsuario(_direccionController.text, _numeroController.text);
    _numeroController.clear();
    _direccionController.clear();
  }
}