import 'dart:convert';

class InfoModel {
  InfoModel({
    this.attack,
    this.defense,
    this.magic,
    this.difficulty,
  });

  final int? attack;
  final int? defense;
  final int? magic;
  final int? difficulty;

  factory InfoModel.fromJson(String str) => InfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toMap() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
      };
}
