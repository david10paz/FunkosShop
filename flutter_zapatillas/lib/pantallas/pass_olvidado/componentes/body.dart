import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../componentes/boton.dart';
import '../../../componentes/formulario_error.dart';
import '../../../componentes/no_registrado.dart';

import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProporcionalPantallaAncho(20)),
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


  //Firebase
  Future<void> _restablecerPass() async{
    if(_formKey.currentState.validate()){

      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      mensajeEnviadoRecPass(context);
      
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
          onChanged: (value){
            if(value.isNotEmpty && errores.contains(emailVacio)){
              setState(() {
                errores.remove(emailVacio);
              });
            }
            else if(emailObligaciones.hasMatch(value) && errores.contains(emailError)){
              setState(() {
                errores.remove(emailError);
              });
            }
            return null;
          },
          validator: (value){
            if(value.isEmpty && !errores.contains(emailVacio)){
              setState(() {
                errores.add(emailVacio);
              });
            }
            else if(!emailObligaciones.hasMatch(value) && !errores.contains(emailError)){
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
              child: SvgPicture.asset(
                "assets/icons/mail.svg", 
                height: getProporcionalPantallaAncho(18)),
            ),
          ),   
        ),
        ErrorFormulario(errores: errores),
        SizedBox(height: 20),
        Boton(
          texto: "Recuperar Contraseña", 
          pulsar: (){
            _restablecerPass();
        }),
        SizedBox(height: 20),
        NoRegistrado(),
      ],),
    );
  }


  mensajeEnviadoRecPass(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Si el usuario se encuentra registrado habrá recibido unas instrucciones para restablecer su contraseña.',
            style: TextStyle(
              fontFamily: 'Marker',
              fontSize: 12,
              color: Colors.indigo
            ),),
          );
        });
  }
}