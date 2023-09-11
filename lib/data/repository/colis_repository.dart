import 'package:packtracer/data/api/api_colis.dart';
import 'package:packtracer/data/models/colis_model.dart';

class ColisRepository {
  final ApiColis _apiColis = ApiColis();

  Future<List<ColisModel>> getAll() {
    return _apiColis.getAll();
  }
}
