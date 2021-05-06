import 'package:flutter/material.dart';
import '../../../componentes/boton.dart';
import '../../../design/config_tam.dart';
import '../../../design/constantes.dart';
import '../../iniciar_sesion/pantalla_sesion.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/logo.jpg",
      "text": "¡BIENVENIDO A TU TIENDA DE FUNKOS EXCLUSIVOS!"
    },
    {
      "text": "Contamos con numerosas colecciones de funkos reconocidos.",
      "image": "assets/images/fondo.jpg"
    },
    {
      "text": "Ofrecemos una gran comodidad en su compra. \nComo una efectiva entrega a su domicilio",
      "image": "assets/images/fondo2.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => ContenidoIntro(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProporcionalPantallaAncho(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                      splashData.length, 
                      (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    Boton(
                      texto: "CONTINUAR",
                      pulsar: (){
                        Navigator.pushNamed(context, PantallaSesion.rutaNombre);
                      }
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: duracionAnimacion,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
      color: currentPage == index ? colorPrincipal : Color(0xFF5D4037),
      borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class ContenidoIntro extends StatelessWidget {
  const ContenidoIntro({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: getProporcionalPantallaAlto(5)),
        Text(
          "FUNKOS SHOP", 
            style: TextStyle(
            fontSize: getProporcionalPantallaAncho(38),
            color: colorPrincipal,
            fontWeight: FontWeight.bold,
            fontFamily: 'Marker'
          ),
        ),
        SizedBox(height: getProporcionalPantallaAlto(10)),
        Image.asset(
          image,
          height: getProporcionalPantallaAlto(300)
          ),
        Spacer(),
        Text(
          text, 
          textAlign: TextAlign.center,
          ),
        Spacer(flex: 2),
      ],
    );
  }
}