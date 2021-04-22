import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/componentes/boton.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';

class AnadirCarrito extends StatefulWidget {
  @override
  _AnadirCarritoState createState() => _AnadirCarritoState();
}

class _AnadirCarritoState extends State<AnadirCarrito> {

  // ignore: deprecated_member_use
  List<Productos> _productosModel = List<Productos>();
  
  // ignore: deprecated_member_use
  List<Productos> _listaCarro = List<Productos>();

@override
    void initState() {
      super.initState();
      _productosDb();
    }

  @override
  Widget build(BuildContext context) {
     return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _productosModel.length,
        
        itemBuilder: (context, index){
          var item = _productosModel[index];
            return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Boton(
                      pulsar: (){
                        setState(() {
                            if (!_listaCarro.contains(item))
                                  _listaCarro.add(item);
                              else
                                  _listaCarro.remove(item);
                            });
                      },
                      texto: "AÑADIR AL CARRITO"),
                  ),
                ),
              ],
            ),
          );
        }
     );
  }

   void _productosDb() {
      var list = <Productos>[
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
      descripcion: "Descubre las zapatillas Air Max 1, el comienzo de todo, en BambasShop. Aprovecha las entregas y devoluciones gratuitas. Haz tu pedido online.",
      imagen: "nikeairmax1rojo.png",
      color: Color(0xFF989493)),
    Productos(
      id: 4,
      titulo: "Chuck Taylor",
      marca: "CONVERSE",
      precio: 235,
      tamano: 10,
      descripcion: "Las Chuck Taylor All Star están pensadas como una silueta de baloncesto, estas míticas sneakers de lona, puntera y suela de goma han tenido un papel importante en la cultura pop. ¿Te las vas a perder?",
      imagen: "conversechucktaylor.png",
      color: Color(0xFF989493))
      ];
  
      setState(() {
        _productosModel = list;
      });
    }
  
}