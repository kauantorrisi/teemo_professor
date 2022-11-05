// To parse this JSON data, do
//
//     final rankedModel = rankedModelFromMap(jsonString);

import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/entry.model.dart';

class RankedModel {
  RankedModel({
    this.tier,
    this.leagueId,
    this.queue,
    this.name,
    this.entries,
  });

  final String? tier;
  final String? leagueId;
  final String? queue;
  final String? name;
  final List<EntryModel?>? entries;

  factory RankedModel.fromJson(String str) =>
      RankedModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankedModel.fromMap(Map<String, dynamic> json) => RankedModel(
        tier: json["tier"],
        leagueId: json["leagueId"],
        queue: json["queue"],
        name: json["name"],
        entries: json["entries"] == null
            ? null
            : List<EntryModel>.from(
                json["entries"].map((x) => EntryModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tier": tier,
        "leagueId": leagueId,
        "queue": queue,
        "name": name,
        "entries": entries == null
            ? null
            : List<dynamic>.from(entries!.map((x) => x!.toMap())),
      };
}
