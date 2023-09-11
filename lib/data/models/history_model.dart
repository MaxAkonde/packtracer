import "dart:convert";

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  int? id;
  String status;

  HistoryModel({
    this.id,
    required this.status,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
}
