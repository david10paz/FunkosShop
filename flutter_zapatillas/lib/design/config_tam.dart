import 'package:flutter/material.dart';

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
  //812 como capa
  return (alto / 812.0) * pantallaAltura;
}

double getProporcionalPantallaAncho(double ancho) {
  double pantallaAncho = SizeConfig.pantallaAncho;
  // 375 como capa
  return (ancho / 375.0) * pantallaAncho;
}