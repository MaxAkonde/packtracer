class DemandeModel {
  int? id;
  String? name;
  String? adress;
  String? telephone;
  String? details;

  DemandeModel({
    this.id,
    this.name,
    this.adress,
    this.telephone,
    this.details,
  });

  factory DemandeModel.fromJson(Map<String, dynamic> json) => DemandeModel(
        id: json["id"],
        name: json["name"],
        adress: json["adress"],
        telephone: json["telephone"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "adress": adress,
        "telephone": telephone,
        "details": details,
      };
}
