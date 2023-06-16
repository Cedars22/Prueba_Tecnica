import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty characters',
      home: HomePage(),
    );
  }
}
