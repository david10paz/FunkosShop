import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../componentes/boton.dart';
import '../../../componentes/formulario_error.dart';
import '../../registrarse_completar/pantalla_registrarse_completar.dart';

import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';

class FormularioRegistar extends StatefulWidget {
  @override
  _FormularioRegistarState createState() => _FormularioRegistarState();
}

class _FormularioRegistarState extends State<FormularioRegistar> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String pass;
  String passConfirmar;
  final List<String> errores = [];

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

  //Firebase - Función que nos hace un nuevo registro de un Nuevo Usuario y envía email para verificación de cuenta.
  Future<void> _crearUsuario() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        FirebaseAuth.instance.currentUser.sendEmailVerification();
        Navigator.pushNamed(context, PantallaRegistarseCompletar.rutaNombre);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          anadirError(error: existeUsuario);
          return "";
        } else {
          quitarError(error: existeUsuario);
        }
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormFieldEmail(),
          SizedBox(
            height: getProporcionalPantallaAlto(20),
          ),
          buildTextFormFieldPass(),
          SizedBox(
            height: getProporcionalPantallaAlto(20),
          ),
          buildTextFormFieldPassConfirmar(),
          ErrorFormulario(errores: errores),
          SizedBox(
            height: getProporcionalPantallaAlto(40),
          ),
          Boton(
              texto: "Continuar",
              pulsar: () {
                _crearUsuario();
              }),
          SizedBox(
            height: getProporcionalPantallaAlto(25),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldPassConfirmar() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onSaved: (newValue) => passConfirmar = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: passVacio);
        }
        if (value.isNotEmpty && pass == passConfirmar) {
          quitarError(error: passDistintos);
        }
        passConfirmar = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: passVacio);
          return "";
        }
        if ((pass != value)) {
          anadirError(error: passDistintos);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirma Contraseña",
        hintText: "Introduzca de nuevo su contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
          ),
          child: SvgPicture.asset("assets/icons/candado.svg",
              height: getProporcionalPantallaAncho(18)),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldPass() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onSaved: (newValue) => pass = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: passVacio);
        }
        if (value.length >= 8) {
          quitarError(error: passCorto);
        }
        pass = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: passVacio);
          return "";
        }
        if (value.length < 8) {
          anadirError(error: passCorto);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Introduzca su contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
          ),
          child: SvgPicture.asset("assets/icons/candado.svg",
              height: getProporcionalPantallaAncho(18)),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: emailVacio);
        }
        if (emailObligaciones.hasMatch(value)) {
          quitarError(error: emailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: emailVacio);
          return "";
        }
        if (!emailObligaciones.hasMatch(value)) {
          anadirError(error: emailError);
          return "";
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
    );
  }
}
