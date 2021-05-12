import 'package:flutter/widgets.dart';
import 'pantallas/db/db.dart';
import 'pantallas/principal/main.dart';
import 'pantallas/iniciar_sesion/pantalla_sesion.dart';
import 'pantallas/pass_olvidado/pantalla_pass_olvidado.dart';
import 'pantallas/registrarse/pantalla_registrarse.dart';
import 'pantallas/registrarse_completar/pantalla_registrarse_completar.dart';
import 'pantallas/intro/pantalla_intro.dart';
import 'pantallas/registrarse_satisfactorio/pantalla_login_satisfactorio.dart';

//Rutas de la app que nos ayudarán a la navegación por ella

final Map<String, WidgetBuilder> rutas = {
  PantallaSesion.rutaNombre: (context) => PantallaSesion(),
  PantallaPassOlvidado.rutaNombre: (context) => PantallaPassOlvidado(),
  PantallaRegistrarseSatisfactorio.rutaNombre: (context) => PantallaRegistrarseSatisfactorio(),
  PantallaRegistrarse.rutaNombre: (context) => PantallaRegistrarse(),
  PantallaRegistarseCompletar.rutaNombre: (context) => PantallaRegistarseCompletar(),
  PantallaPrincipal.rutaNombre: (context) => PantallaPrincipal(),
  FirebaseInitial.rutaNombre: (context) => FirebaseInitial(),
  PantallaIntro.rutaNombre: (context) => PantallaIntro(),
};