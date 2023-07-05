import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba_tecnica/models/personaje.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      var dir = (await getApplicationDocumentsDirectory()).path;
      return await Isar.open(
        [PersonajeSchema],
        directory: dir,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> createPersonaje(List<Personaje> newPersonajes) async {
    final isar = await db;
    await isar.writeTxn(() => isar.personajes.putAll(newPersonajes));
  }

  Stream<List<Personaje>> getAllCharactersDB() async* {
    final isar = await db;
    yield* isar.personajes.where().watch(fireImmediately: true);
  }

  Future<List<Personaje>> getFilterCharactersDB(
      String filtroStatus, String filtroName, String filtroSpecies) async {
    final isar = await db;
    return isar.personajes
        .filter()
        .statusContains(filtroStatus)
        .speciesContains(filtroSpecies)
        .nameContains(filtroName)
        .findAll();
  }

  Stream<List<Personaje>> getFilterCharactersDBStream(
      String filtroStatus, String filtroName, String filtroSpecies) async* {
    final isar = await db;
    yield* isar.personajes
        .where()
        .filter()
        .statusContains(filtroStatus)
        .speciesContains(filtroSpecies)
        .nameContains(filtroName)
        .watch();
  }

  Future<int> getCharacterCount() async {
    final isar = await db;
    return isar.personajes.count();
  }

  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
