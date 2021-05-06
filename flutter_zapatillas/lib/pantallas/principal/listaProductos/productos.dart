import 'package:flutter/material.dart';

class Productos {
  final String imagen, titulo, descripcion, coleccion;
  final double precio, tamano;
  final int id;
  int cantidad;
  final Color color;
  Productos({
    this.id,
    this.imagen,
    this.titulo,
    this.precio,
    this.tamano,
    this.descripcion,
    this.color,
    this.coleccion,
    this.cantidad = 1
  });
}

List<Productos> productsLista = [
  Productos(
        id: 1,
        titulo: "Flash",
        coleccion: "MARVEL",
        precio: 15.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop The Flash, este Funko Pop de The Flash es un producto oficial Funko. \nEste muñeco Pop tiene el nº 213 de su colección de The Flash, su nombre original es Funko Pop Vinyl The Flash de la licencia The Flash.",
        imagen: "flash.png",
        color: Color(0xFFFFD600)),
  Productos(
        id: 2,
        titulo: "Buzz Lightyear",
        coleccion: "TOY STORY",
        precio: 14.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop Buzz Lightyear, este Funko Pop de Toy Story 4 es un producto oficial Funko. \nEste muñeco Pop tiene el nº 523 de su colección de Toy Story 4, su nombre original es Funko Pop Vinyl Buzz Lightyear de la licencia Toy Story 4.",
        imagen: "buzz.png",
        color: Color(0xFF1B5E20)),
  Productos(
        id: 3,
        titulo: "Harley Quinn",
        coleccion: "ESCUADRÓN SUICIDA",
        precio: 18.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop Harley Quinn, este Funko Pop de Escuadrón Suicida es un producto oficial Funko. \nEste muñeco Pop tiene el nº 97 de su colección de Escuadrón Suicida, su nombre original es Funko Pop Vinyl Harley Quinn de la licencia Suicide Squad.",
        imagen: "harleyquinn.png",
        color: Color(0xFFF48FB1)),
   Productos(
        id: 4,
        titulo: "Marty McFly",
        coleccion: "REGRESO AL FUTURO",
        precio: 17.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop Marty McFly, este Funko Pop de Back To The Future es un producto oficial Funko. \nEste muñeco Pop tiene el nº 245 de su colección de Back To The Future, su nombre original es Funko Pop Vinyl Marty McFly de la licencia Back To The Future.",
        imagen: "martymcfly.png",
        color: Color(0xFF1A237E)),
   Productos(
        id: 5,
        titulo: "Po",
        coleccion: "Kung Fu Panda",
        precio: 15.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop Po, este Funko Pop de Kung Fu Panda es un producto oficial Funko. \nEste muñeco Pop tiene el nº 250 de su colección de Kung Fu Panda, su nombre original es Funko Pop Vinyl Po de la licencia Kung Fu Panda.",
        imagen: "po.png",
        color: Color(0xFF424242)),
     Productos(
        id: 6,
        titulo: "Spider-Man",
        coleccion: "MARVEL",
        precio: 18,
        tamano: 9,
        descripcion: "Comprar Funko Pop Iron Spider, este Funko Pop de Los Vengadores: Infinity War es un producto oficial Funko. \nEste muñeco Pop tiene el nº 287 de su colección de Los Vengadores: Infinity War, su nombre original es Funko Pop Vinyl Iron Spider de la licencia Avengers Infinity War.",
        imagen: "spiderman.png",
        color: Color(0xFFB71C1C)),
     Productos(
        id: 7,
        titulo: "Grinch",
        coleccion: "The Grinch",
        precio: 16.90,
        tamano: 9,
        descripcion: "Comprar Funko Pop El Grinch, este Funko Pop de El Grinch es un producto oficial Funko. \nEste muñeco Pop tiene el nº 659 de su colección de El Grinch, su nombre original es Funko Pop Vinyl The Grinch de la licencia The Grinch.",
        imagen: "grinch.png",
        color: Color(0xFFC5E1A5)),
     Productos(
        id: 8,
        titulo: "It",
        coleccion: "IT",
        precio: 17.90,
        tamano: 9,
        descripcion: "Comprar Funko Pop It, este Funko Pop de It es un producto oficial Funko. \nEste muñeco Pop tiene el nº 477 de su colección de It, su nombre original es Funko Pop Vinyl It de la licencia It.",
        imagen: "it.png",
        color: Color(0xFFFFB74D)),
     Productos(
        id: 9,
        titulo: "Profesor",
        coleccion: "La casa de Papel",
        precio: 14.90,
        tamano: 9,
        descripcion: "Comprar Funko Pop El Profesor, este Funko Pop de La Casa de Papel es un producto oficial Funko. \nEste muñeco Pop tiene el nº 744 de su colección de La Casa de Papel, su nombre original es Funko Pop Vinyl The Professor de la licencia La Casa de Papel.",
        imagen: "profe.png",
        color: Color(0xFF424242)),
     Productos(
        id: 10,
        titulo: "Bob",
        coleccion: "Minions",
        precio: 15.50,
        tamano: 9,
        descripcion: "Comprar Funko Pop Bob en pijama, este Funko Pop de Minions es un producto oficial Funko. \nEste muñeco Pop tiene el nº 905 de su colección de Minions, su nombre original es Funko Pop Vinyl Pajama Bob de la licencia Minions.",
        imagen: "minion.png",
        color: Color(0xFFFFE082)),
     Productos(
        id: 11,
        titulo: "Cap. Calzoncillos",
        coleccion: "Capitan Calzoncillos",
        precio: 17.90,
        tamano: 9,
        descripcion: "Comprar Funko Pop Capitan Calzoncillos, este Funko Pop de Capitan Calzoncillos es un producto oficial Funko. \nEste muñeco Pop tiene el nº 426 de su colección de Capitan Calzoncillos, su nombre original es Funko Pop Vinyl Capitan Calzoncillos de la licencia Capitan Calzoncillos.",
        imagen: "capitancalzoncillos.png",
        color: Color(0xFFE53935)),
    Productos(
        id: 12,
        titulo: "Brian",
        coleccion: "Family Guy",
        precio: 17,
        tamano: 10,
        descripcion: "Comprar Funko Pop Brian, este Funko Pop de Family Guy es un producto oficial Funko. \nEste muñeco Pop tiene el nº 32 de su colección de Family Guy, su nombre original es Funko Pop Vinyl Brian de la licencia Family Guy.",
        imagen: "brian.png",
        color: Color(0xFF000000)),
];


List<Productos> productsCarrito = [
  
];