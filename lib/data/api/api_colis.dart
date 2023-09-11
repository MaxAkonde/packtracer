import 'package:dio/dio.dart';
import 'package:packtracer/data/models/colis_model.dart';

class ApiColis {
  Dio dio = Dio();

  final String _url = "http://172.20.10.3:8000/api/colis";

  Future<List<ColisModel>> getAll() async {
    try {
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
      return value.map((e) => ColisModel.fromJson(e)).toList();
    } catch (e) {
      return throw Exception("Erreur");
    }
  }
}
