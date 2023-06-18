import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/home_page.dart';
import 'package:prueba_tecnica/pages/personaje_detalle.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty characters',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        'detalle': (BuildContext context) => const PersonajeDetalle(),
      },
    );
  }
}
