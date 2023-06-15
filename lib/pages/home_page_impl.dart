import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/bloc/home_bloc.dart';
import 'package:prueba_tecnica/bloc/home_states.dart';
import 'package:prueba_tecnica/pages/home_page_body.dart';
import 'package:prueba_tecnica/pages/loading_page.dart';

class HomePageImplementation extends StatefulWidget {
  const HomePageImplementation({super.key});

  @override
  _HomePageImplementationState createState() => _HomePageImplementationState();
}

class _HomePageImplementationState extends State<HomePageImplementation> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: _builder, listener: _listener);
  }

  Widget _builder(BuildContext context, HomeState state) {
    if (state is HomeStateLoading) {
      return const LoadingPage();
    } else {
      return const HomePageBody();
    }
  }

  void _listener(BuildContext context, HomeState state) {
    if (state is HomeStateError) {
      const Text('No se logro cargar la informacion');
    }
    if (state is HomeStateSucces) {
      //_openNextPage();
    }
  }

  //void _openNextPage() {}
}
