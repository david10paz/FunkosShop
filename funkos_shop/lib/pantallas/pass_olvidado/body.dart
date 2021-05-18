import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../componentes/boton.dart';
import '../../componentes/formulario_error.dart';
import '../iniciar_sesion/componentes/no_registrado.dart';

import '../../design/config_tam.dart';
import '../../design/constantes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProporcionalPantallaAncho(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.pantallaAltura * 0.04),
              Text(
                "Recuperar Contraseña",
                style: TextStyle(
                  fontSize: getProporcionalPantallaAncho(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Por favor introduce el e-mail con el que estás registrado y se te enviará un correo para recuperar tu contraseña.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.pantallaAltura * 0.1),
              FormularioPassOlvidado(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormularioPassOlvidado extends StatefulWidget {
  @override
  _FormularioPassOlvidadoState createState() => _FormularioPassOlvidadoState();
}

class _FormularioPassOlvidadoState extends State<FormularioPassOlvidado> {
  void anadirError({String error}) {
    if (!errores.contains(error))
      setState(() {
        errores.add(error);
      });
  }

  void quitarError({String error}) {
    if (errores.contains(error))
      setState(() {
        errores.remove(error);
      });
  }

  //Firebase - Mensaje Correo Restablecer Pass
  Future<void> _restablecerPass() async {
    try {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        mensajeEnviadoRecPass(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        anadirError(error: noExiste);
        return "";
      } else {
        quitarError(error: noExiste);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  List<String> errores = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errores.contains(emailVacio)) {
                setState(() {
                  errores.remove(emailVacio);
                });
              } else if (emailObligaciones.hasMatch(value) &&
                  errores.contains(emailError)) {
                setState(() {
                  errores.remove(emailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errores.contains(emailVacio)) {
                setState(() {
                  errores.add(emailVacio);
                });
              } else if (!emailObligaciones.hasMatch(value) &&
                  !errores.contains(emailError)) {
                setState(() {
                  errores.add(emailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "E-mail",
              hintText: "Introduzca su e-mail",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  getProporcionalPantallaAncho(20),
                  getProporcionalPantallaAncho(20),
                  getProporcionalPantallaAncho(20),
                ),
                child: SvgPicture.asset("assets/icons/mail.svg",
                    height: getProporcionalPantallaAncho(18)),
              ),
            ),
          ),
          ErrorFormulario(errores: errores),
          SizedBox(height: 20),
          Boton(
              texto: "Recuperar Contraseña",
              pulsar: () {
                _restablecerPass();
              }),
          SizedBox(height: 20),
          NoRegistrado(),
        ],
      ),
    );
  }

  mensajeEnviadoRecPass(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Has recibido unas instrucciones a tu correo para restablecer tu contraseña.',
              style: TextStyle(
                  fontFamily: 'Marker', fontSize: 12, color: Colors.indigo),
            ),
          );
        });
  }
}
