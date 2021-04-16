import 'package:flutter/material.dart';
import 'config_tam.dart';

const colorPrincipal = Color(0xFF5D4037);
const colorSecundario = Color(0xFF979797);
const colorTexto = Color(0xFF757575);

const duracionAnimacion = Duration(milliseconds: 200);

final cabeceraStyle = TextStyle(
  fontSize: getProporcionalPantallaAncho(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Formulario errores
final RegExp emailObligaciones =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailVacio = "Email vacío";
const String emailError = "Email no admitido";
const String passVacio = "Contraseña vacía ";
const String passCorto = "Contraseña demasiado corta";
const String passDistintos = "Contraseñas no coinciden";
const String nombreVacio = "Por favor rellena tu nombre";
const String numeroVacio = "Por favor introduce tu numero de telefono";
const String dirVacio = "Por favor introduce tu dirección";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProporcionalPantallaAncho(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProporcionalPantallaAncho(15)),
    borderSide: BorderSide(color: colorTexto),
  );
}
