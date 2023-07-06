import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba_tecnica/database/isar_database.dart';
import 'package:prueba_tecnica/models/personaje.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerSingletonAsync<IsarDataBase>(() async {
    final isar = await getIsarInstance();
    return IsarDataBase(isar: isar);
  });
}

Future<Isar> getIsarInstance() async {
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
