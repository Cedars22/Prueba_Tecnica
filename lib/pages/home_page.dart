import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/bloc/home_bloc.dart';
import 'package:prueba_tecnica/bloc/home_states.dart';
import 'package:prueba_tecnica/pages/home_page_impl.dart';
import 'package:prueba_tecnica/repository/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc(HomeStateInitial(), repository: Repository());
      },
      child: const HomePageImplementation(),
    );
  }
}
