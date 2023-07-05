// import 'package:get_it/get_it.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:prueba_tecnica/models/personaje.dart';

// GetIt getIt = GetIt.instance;

// void setupLocator() {
//   getIt.registerSingletonAsync<Isar>(() async {
//     final dir = await getApplicationDocumentsDirectory();
//     return Isar.getInstance('default') ??
//         await Isar.open(
//           [
//             PersonajeSchema,
//           ],
//           directory: dir.path,
//         );
//   });
// }

//   Future<void> createPersonaje(List<Personaje> newPersonajes) async {
//     final isar = await db;
//     await isar.writeTxn(() => isar.personajes.putAll(newPersonajes));
//   }

//   // Future<List<Personaje>> getAllCharactersDB(
//   //     String filtroStatus, String filtroName, String filtroSpecies) async {
//   //   final isar = await db;
//   //   return isar.personajes
//   //       .where()
//   //       .filter()
//   //       .statusEqualTo(filtroStatus)
//   //       .nameEqualTo(filtroName)
//   //       .speciesEqualTo(filtroSpecies);
//   //   // .statusStartsWith('Dead')
//   //   // .nameEqualTo('Rick')
//   //   // .nameContains('Morty')
//   //   // .watch(fireImmediately: true);
//   // }
//   Future<List<Personaje>> getAllCharactersDB(
//       String filtroStatus, String filtroName, String filtroSpecies) async {
//     final isar = await db;
//     return isar.personajes.where().findAll();
//   }

//   Future<void> cleanDB() async {
//     final isar = await db;
//     await isar.writeTxn(() => isar.clear());
//   }

