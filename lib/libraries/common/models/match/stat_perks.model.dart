import 'dart:convert';

class StatPerksModel {
  StatPerksModel({
    this.defense,
    this.flex,
    this.offense,
  });

  final int? defense;
  final int? flex;
  final int? offense;

  factory StatPerksModel.fromJson(String str) =>
      StatPerksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatPerksModel.fromMap(Map<String, dynamic> json) => StatPerksModel(
        defense: json["defense"],
        flex: json["flex"],
        offense: json["offense"],
      );

  Map<String, dynamic> toMap() => {
        "defense": defense,
        "flex": flex,
        "offense": offense,
      };
}
