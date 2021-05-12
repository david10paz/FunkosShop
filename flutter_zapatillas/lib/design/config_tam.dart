import 'package:flutter/material.dart';

//Con esta clase configuramos espacios entre diversos campos

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double pantallaAncho;
  static double pantallaAltura;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pantallaAncho = _mediaQueryData.size.width;
    pantallaAltura = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProporcionalPantallaAlto(double alto) {
  double pantallaAltura = SizeConfig.pantallaAltura;
  return (alto / 812.0) * pantallaAltura;
}

double getProporcionalPantallaAncho(double ancho) {
  double pantallaAncho = SizeConfig.pantallaAncho;
  return (ancho / 375.0) * pantallaAncho;
}