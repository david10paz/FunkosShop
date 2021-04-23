import 'package:firebase_auth/firebase_auth.dart';
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

List<Productos> productsLista = [
  Productos(
        id: 1,
        titulo: "Yeezy",
        marca: "ADIDAS",
        precio: 232,
        tamano: 12,
        descripcion: "Adidas Yeezy son un modelo versátil con una suela deportiva muy cómoda. Podrás usarlas en cualquier ocasión. Compralas ya!",
        imagen: "adidasyeezy.png",
        color: Color(0xFF3D82AE)),
  Productos(
      id: 2,
        titulo: "Travis Scott",
        marca: "NIKE",
        precio: 233,
        tamano: 8,
        descripcion: "Las Nike x Travis Scott cuentan con un estilo inspirado en la imaginación de Travis Scott para huir de la realidad y escapar con sus seguidores a un mundo paralelo. No te quedes sin ellas.",
        imagen: "niketravis.png",
        color: Color(0xFFD3A984)),
  Productos(
      id: 3,
        titulo: "Air Max 1 RED",
        marca: "NIKE",
        precio: 234,
        tamano: 10,
        descripcion: FirebaseAuth.instance.currentUser.toString(),
        imagen: "nikeairmax1rojo.png",
        color: Color(0xFFB71C1C)),
  Productos(
      id: 4,
      titulo: "Chuck Taylor",
      marca: "CONVERSE",
      precio: 235,
      tamano: 10,
      descripcion: "Las Chuck Taylor All Star están pensadas como una silueta de baloncesto, estas míticas sneakers de lona, puntera y suela de goma han tenido un papel importante en la cultura pop. ¿Te las vas a perder?",
      imagen: "conversechucktaylor.png",
      color: Color(0xFF989493)),
];


List<Productos> productsCarrito = [
  
];