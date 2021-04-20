import 'package:flutter/material.dart';

class Productos {
  final String imagen, titulo, descripcion, marca;
  final int precio, tamano, id;
  final Color color;
  Productos({
    this.id,
    this.imagen,
    this.titulo,
    this.precio,
    this.descripcion,
    this.tamano,
    this.color,
    this.marca
  });
}

List<Productos> productos = [
  Productos(
      id: 1,
      titulo: "Yeezy",
      marca: "ADIDAS",
      precio: 232,
      tamano: 12,
      descripcion: "Adidas Yeezy son un modelo versátil con una suela deportiva muy cómoda. Podrás usarlas en cualquier ocasión. Compralas ya!",
      imagen: "assets/images/productos/adidasyeezy.png",
      color: Color(0xFF3D82AE)),
  Productos(
      id: 2,
      titulo: "Travis Scott",
      marca: "NIKE",
      precio: 233,
      tamano: 8,
      descripcion: "Las Nike x Travis Scott cuentan con un estilo inspirado en la imaginación de Travis Scott para huir de la realidad y escapar con sus seguidores a un mundo paralelo. No te quedes sin ellas.",
      imagen: "assets/images/productos/niketravis.png",
      color: Color(0xFFD3A984)),
  Productos(
      id: 3,
      titulo: "Air Max 1 RED",
      marca: "NIKE",
      precio: 234,
      tamano: 10,
      descripcion: "Descubre las zapatillas Air Max 1, el comienzo de todo, en BambasShop. Aprovecha las entregas y devoluciones gratuitas. Haz tu pedido online.",
      imagen: "assets/images/productos/nikeairmax1rojo.png",
      color: Color(0xFF989493)),
    Productos(
      id: 4,
      titulo: "Chuck Taylor",
      marca: "CONVERSE",
      precio: 235,
      tamano: 10,
      descripcion: "Las Chuck Taylor All Star están pensadas como una silueta de baloncesto, estas míticas sneakers de lona, puntera y suela de goma han tenido un papel importante en la cultura pop. ¿Te las vas a perder?",
      imagen: "assets/images/productos/conversechucktaylor.png",
      color: Color(0xFF989493))
];