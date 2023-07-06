import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/router/app_router.dart';
import 'package:prueba_tecnica/get_it/get_it.dart';

void main() async {
  setupLocator();
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
      routes: AppRouter.routes,
    );
  }
}
