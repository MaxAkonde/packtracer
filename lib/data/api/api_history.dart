import 'package:dio/dio.dart';
import 'package:packtracer/data/models/history_model.dart';

class ApiHistory {
  Dio dio = Dio();

  Future<List<HistoryModel>> getByColis(idColis) async {
    final String _url = "http://172.20.10.3:8000/api/histories/colis/$idColis";

    try {
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
      print(value);
      return value.map((e) => HistoryModel.fromJson(e)).toList();
    } catch (e) {
      return throw Exception("Erreur");
    }
  }
}
