import 'package:dio/dio.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/models/result.dart';

class Repository {
  Future<List<Personaje>> getCharacters() async {
    Dio dio = Dio();
    dio.options.baseUrl = "https://rickandmortyapi.com/";

    try {
      var response = await dio.get("api/character");
      if (response.statusCode == 200) {
        Result result = Result.fromJson(response.data);
        if (result.personajes != null) {
          return result.personajes!;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      return [];
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      return [];
    }
  }

  Future<List<Personaje>> fetchCharacters(String url, int currentPage,
      String filtroStatus, String filtroName, String filtroSpecies) async {
    Dio dio = Dio();
    dio.options.baseUrl = "https://rickandmortyapi.com/";
    try {
      var response = await dio.get(
          '/api/character/?page=$currentPage&status=$filtroStatus&name=$filtroName&species=$filtroSpecies');
      if (response.statusCode == 200) {
        Result result = Result.fromJson(response.data);
        if (result.personajes != null) {
          return result.personajes!.toList();
        } else {
          return [];
        }
      } else {
        return [];
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      // return [];
      throw Exception("el endpoint está mal configurado");
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      return [];
    }
  }
}
