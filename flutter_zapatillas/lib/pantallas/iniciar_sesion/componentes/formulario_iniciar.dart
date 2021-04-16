import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../componentes/boton.dart';
import '../../../componentes/formulario_error.dart';
import '../../principal/pantalla_principal.dart';

import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';
import '../../pass_olvidado/pantalla_pass_olvidado.dart';


class FormularioIniciar extends StatefulWidget {
  @override
  _FormularioIniciarState createState() => _FormularioIniciarState();
}

class _FormularioIniciarState extends State<FormularioIniciar> {
   final _formKey = GlobalKey<FormState>();
    String email;
    String pass;
    bool recordar = false;
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


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormFieldEmail(),
          SizedBox(height: getProporcionalPantallaAlto(25)),
          buildTextFormFieldPass(),
          SizedBox(height: getProporcionalPantallaAlto(25)),
          Row(
            children: [
              Checkbox(value: recordar, onChanged: (value){
                setState(() {
                  recordar = value;
                });
              }),
              Text("Recordar"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context, PantallaPassOlvidado.rutaNombre),
                  child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          ErrorFormulario(errores: errores),
          SizedBox(height: getProporcionalPantallaAlto(25),),
          Boton(
            texto:"ENTRAR", 
            pulsar:(){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                Navigator.pushNamed(context, PantallaPrincipal.rutaNombre);
              }
            }
          ),
          SizedBox(height: getProporcionalPantallaAlto(25),),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldPass() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onSaved: (newValue) => pass = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          quitarError(error: passVacio);
        }
        else if(value.length >= 8){
          quitarError(error: passCorto);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          anadirError(error: passVacio);
          return "";
        }
        else if(value.length < 8){
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
        child: SvgPicture.asset(
          "assets/icons/candado.svg", 
          height: getProporcionalPantallaAncho(18)),
        ),
      ),   
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          quitarError(error: emailVacio);
        }
        else if(emailObligaciones.hasMatch(value)){
          quitarError(error: emailError);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          anadirError(error: emailVacio);
          return "";
        }
        else if(!emailObligaciones.hasMatch(value)){
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
          child: SvgPicture.asset(
            "assets/icons/mail.svg", 
            height: getProporcionalPantallaAncho(18)),
        ),
      ),   
    );
  }
}

