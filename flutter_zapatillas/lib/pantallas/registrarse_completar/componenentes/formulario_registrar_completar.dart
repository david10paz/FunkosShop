import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../componentes/boton.dart';
import '../../../componentes/formulario_error.dart';
import '../../../design/constantes.dart';
import '../../registrarse_satisfactorio/pantalla_login_satisfactorio.dart';

import '../../../design/config_tam.dart';

class FormularioRegistrarCompletar extends StatefulWidget {
  @override
  _FormularioRegistrarCompletarState createState() =>
      _FormularioRegistrarCompletarState();
}

class _FormularioRegistrarCompletarState
    extends State<FormularioRegistrarCompletar> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errores = [];
  String nombre;
  String apellidos;
  String numero;
  String dir;

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormFieldNombre(),
          SizedBox(height: getProporcionalPantallaAlto(20)),
          buildTextFormFieldNumero(),
          SizedBox(height: getProporcionalPantallaAlto(20)),
          buildTextFormFieldDir(),
          ErrorFormulario(errores: errores),
          SizedBox(height: getProporcionalPantallaAlto(40)),
          Boton(
            texto: "Continuar",
            pulsar: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, PantallaRegistrarseSatisfactorio.rutaNombre);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldNombre() {
    return TextFormField(
      onSaved: (newValue) => nombre = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: nombreVacio);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: nombreVacio);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nombre",
        hintText: "Introduzca su nombre",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
          ),
          child: SvgPicture.asset("assets/icons/user.svg",
              height: getProporcionalPantallaAncho(18)),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldNumero() {
    return TextFormField(
      onSaved: (newValue) => numero = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: numeroVacio);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: numeroVacio);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Numero de Teléfono",
        hintText: "Introduzca su número",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
          ),
          child: SvgPicture.asset("assets/icons/numero.svg",
              height: getProporcionalPantallaAncho(18)),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldDir() {
    return TextFormField(
      onSaved: (newValue) => dir = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          quitarError(error: dirVacio);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          anadirError(error: dirVacio);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Direccion",
        hintText: "Introduzca su dirección",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
            getProporcionalPantallaAncho(20),
          ),
          child: SvgPicture.asset("assets/icons/direccion.svg",
              height: getProporcionalPantallaAncho(18)),
        ),
      ),
    );
  }
}
