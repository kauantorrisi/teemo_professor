import 'dart:convert';

class SkinModel {
  SkinModel({
    this.id,
    this.num,
    this.name,
    this.chromas,
  });

  final String? id;
  final int? num;
  final String? name;
  final bool? chromas;

  factory SkinModel.fromJson(String str) => SkinModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SkinModel.fromMap(Map<String, dynamic> json) => SkinModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "num": num,
        "name": name,
        "chromas": chromas,
      };
}
