import 'package:dio/dio.dart';
import 'package:prueba_tecnica/models/result.dart';

const String baseUrl = "https://rickandmortyapi.com/";

class Repository {
  Future<Result?> fetchCharacters(String url, int currentPage,
      String filtroStatus, String filtroName, String filtroSpecies) async {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    try {
      var response = await dio.get(
          '/api/character/?page=$currentPage&status=$filtroStatus&name=$filtroName&species=$filtroSpecies');
      if (response.statusCode == 200) {
        Result result = Result.fromJson(response.data);
        return result;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      // return [];
      throw Exception("el endpoint está mal configurado");
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      throw Exception("Error por formato");
      // return [];
    }
  }
}
