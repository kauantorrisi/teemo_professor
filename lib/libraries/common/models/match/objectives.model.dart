import 'dart:convert';
import 'package:teemo_professor/libraries/common/models/match/objectives_data.model.dart';

class ObjectivesModel {
  ObjectivesModel({
    this.baron,
    this.champion,
    this.dragon,
    this.inhibitor,
    this.riftHerald,
    this.tower,
  });

  final ObjectivesDataModel? baron;
  final ObjectivesDataModel? champion;
  final ObjectivesDataModel? dragon;
  final ObjectivesDataModel? inhibitor;
  final ObjectivesDataModel? riftHerald;
  final ObjectivesDataModel? tower;

  factory ObjectivesModel.fromJson(String str) =>
      ObjectivesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ObjectivesModel.fromMap(Map<String, dynamic> json) => ObjectivesModel(
        baron: json["baron"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["baron"]),
        champion: json["champion"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["champion"]),
        dragon: json["dragon"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["dragon"]),
        inhibitor: json["inhibitor"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["inhibitor"]),
        riftHerald: json["riftHerald"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["riftHerald"]),
        tower: json["tower"] == null
            ? null
            : ObjectivesDataModel.fromMap(json["tower"]),
      );

  Map<String, dynamic> toMap() => {
        "baron": baron == null ? null : baron!.toMap(),
        "champion": champion == null ? null : champion!.toMap(),
        "dragon": dragon == null ? null : dragon!.toMap(),
        "inhibitor": inhibitor == null ? null : inhibitor!.toMap(),
        "riftHerald": riftHerald == null ? null : riftHerald!.toMap(),
        "tower": tower == null ? null : tower!.toMap(),
      };
}
