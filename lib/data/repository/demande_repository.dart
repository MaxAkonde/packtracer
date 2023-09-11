import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:packtracer/data/models/demande_model.dart';

class DemandeRepository {
  Future collect({
    required String name,
    required String adress,
    required String telephone,
    required String details,
  }) async {
    final response = await http.post(
      Uri.parse("http://172.20.10.3:8000/api/demande"),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "adress": adress,
        "telephone": telephone,
        "details": details,
      }),
    );

    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return DemandeModel.fromJson(jsonResponse);
    } else {
      throw Exception("Erreur lors de la demande");
    }
  }
}
