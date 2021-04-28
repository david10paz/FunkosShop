import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zapatillas/componentes/boton.dart';


class PantallaPago extends StatefulWidget {
  @override
  _PantallaPagoState createState() => _PantallaPagoState();
}

class _PantallaPagoState extends State<PantallaPago> {

  String numeroTarjeta = '';
  String fechaCaducidad = '';
  String titularTarjeta = '';
  String cvv = '';
  bool isCvvFocused = false;

  void modeloCamposTarjeta(CreditCardModel modelo){
    setState(() {
      numeroTarjeta = modelo.cardNumber;
      fechaCaducidad = modelo.expiryDate;
      titularTarjeta = modelo.cardHolderName;
      cvv = modelo.cvvCode;
      isCvvFocused = modelo.isCvvFocused;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardWidget(
                  cardNumber: numeroTarjeta, 
                  expiryDate: fechaCaducidad, 
                  cardHolderName: titularTarjeta, 
                  cvvCode: cvv, 
                  showBackView: isCvvFocused,
                  cardBgColor: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  animationDuration: Duration(milliseconds: 1200),
                ),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                onCreditCardModelChange: modeloCamposTarjeta,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}