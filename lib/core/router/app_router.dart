import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/personaje_detalle.dart';

class AppRouter {
  static String homePage = "/";
  static String detailPage = "detalle";

  static final routes = {
    '/': (BuildContext context) => const HomePage(),
    'detalle': (BuildContext context) => const PersonajeDetalle(),
  };
}
