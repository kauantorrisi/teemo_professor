import 'dart:convert';

class BanModel {
  BanModel({
    this.championId,
    this.pickTurn,
  });

  final int? championId;
  final int? pickTurn;

  factory BanModel.fromJson(String str) => BanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BanModel.fromMap(Map<String, dynamic> json) => BanModel(
        championId: json["championId"],
        pickTurn: json["pickTurn"],
      );

  Map<String, dynamic> toMap() => {
        "championId": championId,
        "pickTurn": pickTurn,
      };
}
