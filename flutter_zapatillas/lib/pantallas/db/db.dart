import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../intro/pantalla_intro.dart';

class FirebaseInitial extends StatelessWidget {
  static String rutaNombre = "/db";
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return PantallaIntro();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return PantallaIntro();
      },
    );
  }
}
