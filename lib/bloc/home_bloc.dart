import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/bloc/home_events.dart';
import 'package:prueba_tecnica/bloc/home_states.dart';
import 'package:prueba_tecnica/repository/repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState, {required this.repository})
      : super(initialState);
  final Repository repository;

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventGetPersonaje) {
      yield HomeStateLoading();
      try {
        // Realiza las operaciones necesarias para obtener los personajes
        // y luego emite el estado de éxito.
        yield HomeStateSucces();
      } catch (error) {
        yield const HomeStateError(error: 'No se logró cargar los personajes');
      }
    } else {
      yield const HomeStateError(error: 'Evento no reconocido');
    }
  }
}
