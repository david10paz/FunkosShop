import 'package:flutter/material.dart';
import 'componentes/body.dart';
import '../../design/config_tam.dart';

class PantallaIntro extends StatelessWidget {
  static String rutaNombre = "/intro";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
