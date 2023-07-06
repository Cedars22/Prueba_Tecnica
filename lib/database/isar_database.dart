import 'package:isar/isar.dart';
import 'package:prueba_tecnica/database/app_crud.dart';
import 'package:prueba_tecnica/models/personaje.dart';

class IsarDataBase implements AppCrud {
  final Isar isar;
  IsarDataBase({required this.isar});

  @override
  Future<void> createPersonaje(List<Personaje> newPersonajes) async {
    await isar.writeTxn(() => isar.personajes.putAll(newPersonajes));
  }

  @override
  Future<List<Personaje>> getFilterCharactersDB(
      String filtroStatus, String filtroName, String filtroSpecies) async {
    return isar.personajes
        .filter()
        .statusContains(filtroStatus)
        .speciesContains(filtroSpecies)
        .nameContains(filtroName)
        .findAll();
  }

  @override
  Future<List<Personaje>> getInitialCharactersDB(
      String filtroStatus, String filtroName, String filtroSpecies) async {
    return isar.personajes
        .where()
        .idGreaterThan(20)
        .filter()
        .statusContains(filtroStatus)
        .speciesContains(filtroSpecies)
        .nameContains(filtroName)
        .findAll();
  }

  @override
  Future<int> getCharacterCount() async {
    return isar.personajes.count();
  }

  @override
  Future<void> cleanDB() async {
    await isar.writeTxn(() => isar.clear());
  }
}
