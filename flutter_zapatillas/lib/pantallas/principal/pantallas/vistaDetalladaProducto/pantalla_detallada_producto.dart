import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../productos.dart';
import 'componentes/body.dart';

class PantallaDetalladaProductos extends StatelessWidget {
  final Productos producto;

  const PantallaDetalladaProductos({Key key, this.producto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: producto.color,
      appBar: buildAppBar(context),
      body: Body(producto: producto),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: producto.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
