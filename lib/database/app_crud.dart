import 'package:prueba_tecnica/models/personaje.dart';

abstract class AppCrud {
  Future<void> createPersonaje(List<Personaje> newPersonajes);

  Future<List<Personaje>> getFilterCharactersDB(
      String filtroStatus, String filtroName, String filtroSpecies);

  Future<List<Personaje>> getInitialCharactersDB(
      String filtroStatus, String filtroName, String filtroSpecies);

  Future<int> getCharacterCount();

  Future<void> cleanDB();
}
