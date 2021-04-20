import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zapatillas/pantallas/principal/main.dart';
import '../../../componentes/boton.dart';
import '../../../componentes/formulario_error.dart';
import '../../../design/constantes.dart';

import '../../../design/config_tam.dart';
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

  
  //Firebase
  Future<void> _comprobarUsuario() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: pass);
        Navigator.pushNamed(context, PantallaPrincipal.rutaNombre);
      }on FirebaseAuthException catch(e){
        
        if (e.code == 'user-not-found') {
          anadirError(error: noExiste);
          return "";
        } else {
          quitarError(error: noExiste);
        }

        if (e.code == 'wrong-password') {
          anadirError(error: noPass);
          return "";
        }
        else{
          quitarError(error: noPass);
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
            pulsar:() async{
                _comprobarUsuario();
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
        if(value.length >= 8){
          quitarError(error: passCorto);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          anadirError(error: passVacio);
          return "";
        }
        if(value.length < 8){
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
        if(emailObligaciones.hasMatch(value)){
          quitarError(error: emailError);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          anadirError(error: emailVacio);
          return "";
        }
        if(!emailObligaciones.hasMatch(value)){
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

