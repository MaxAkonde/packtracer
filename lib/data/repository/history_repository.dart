import 'package:packtracer/data/api/api_history.dart';
import 'package:packtracer/data/models/history_model.dart';

class HistoryRepository {
  final ApiHistory _apiHistory = ApiHistory();

  Future<List<HistoryModel>> getByColis(idColis) {
    return _apiHistory.getByColis(idColis);
  }
}
