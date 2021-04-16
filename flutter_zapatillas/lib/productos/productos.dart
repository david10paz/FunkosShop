import 'package:flutter/material.dart';

class Productos{
  final String imagen, titulo, descripcion;
  final int precio, tamano, id;
  final Color color;

  Productos({
    this.id,
    this.imagen,
    this.titulo,
    this.precio,
    this.descripcion,
    this.tamano,
    this.color
  });
}

List<Productos> productos = [
  Productos(
      id: 1,
      titulo: "Nike 1000",
      precio: 345,
      descripcion: "dummyText",
      tamano: 41,
      imagen: "assets/images/productos/niketravis.png",
      color: Colors.lightGreen
  ),
  Productos(
      id: 2,
      titulo: "Nike 2000",
      precio: 355,
      descripcion: "dummyText",
      tamano: 42,
      imagen: "assets/images/productos/adidasyeezy.png",
      color: Colors.lightGreen
  ),
  
  
];