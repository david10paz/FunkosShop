import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/pantallas/carro/componentes/body.dart';
import 'package:flutter_zapatillas/pantallas/principal/listaProductos/productos.dart';
import 'package:flutter_zapatillas/pantallas/principal/pantallas/vistaDetalladaProducto/pantalla_detallada_producto.dart';

class PantallaPrincipalProductos extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'App Compras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 38,
                    ),
                    if (_listaCarro.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _listaCarro.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (_listaCarro.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(_listaCarro),
                      ),
                    );
                },
              ),
            )
          ],
        ),
        body: _cuadroProductos()
      );
    }
  
  
  
  
    GridView _cuadroProductos() {
      return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _productosModel.length,
        
        itemBuilder: (context, index){
          final String imagen = _productosModel[index].imagen;
          var item = _productosModel[index];
          
          return GestureDetector(
              onTap: () => Navigator.push(context,MaterialPageRoute(
                    builder: (context) => PantallaDetalladaProductos(
                    producto:item,
                    ),
                  )
                ),
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(18)),
                        child:new Image.asset("assets/images/productos/$imagen")
                      ),
                      Text(
                        item.titulo,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            item.precio.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                child: (!_listaCarro.contains(item))
                                    ? Icon(
                                        Icons.shopping_cart,
                                        color: Colors.green,
                                        size: 38,
                                      )
                                    : Icon(
                                        Icons.shopping_cart,
                                        color: Colors.red,
                                        size: 38,
                                      ),
                                onTap: () {
                                  setState(() {
                                    if (!_listaCarro.contains(item))
                                      _listaCarro.add(item);
                                    else
                                      _listaCarro.remove(item);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            );
        },
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