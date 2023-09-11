import "dart:convert";

ColisModel colisModelFromJson(String str) =>
    ColisModel.fromJson(json.decode(str));

String colisModelToJson(ColisModel data) => json.encode(data.toJson());

class ColisModel {
  int? id;
  String trackingNumber;
  String status;
  String location;

  ColisModel({
    this.id,
    required this.trackingNumber,
    required this.status,
    required this.location,
  });

  factory ColisModel.fromJson(Map<String, dynamic> json) => ColisModel(
        id: json["id"],
        trackingNumber: json["trackingNumber"],
        status: json["status"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trackingNumber": trackingNumber,
        "status": status,
        "location": location,
      };
}
