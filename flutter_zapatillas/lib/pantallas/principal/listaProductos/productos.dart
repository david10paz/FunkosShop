import 'package:flutter/material.dart';

class Productos {
  final String imagen, titulo, descripcion, marca;
  final int precio, tamano, id;
  int cantidad;
  final Color color;
  Productos({
    this.id,
    this.imagen,
    this.titulo,
    this.precio,
    this.descripcion,
    this.tamano,
    this.color,
    this.marca,
    this.cantidad = 1
  });
}