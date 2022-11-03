import 'dart:convert';

class ObjectivesDataModel {
  ObjectivesDataModel({
    this.first,
    this.kills,
  });

  final bool? first;
  final int? kills;

  factory ObjectivesDataModel.fromJson(String str) =>
      ObjectivesDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ObjectivesDataModel.fromMap(Map<String, dynamic> json) =>
      ObjectivesDataModel(
        first: json["first"],
        kills: json["kills"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "kills": kills,
      };
}
