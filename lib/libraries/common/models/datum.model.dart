import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/image.model.dart';

class DatumModel {
  DatumModel({
    this.id,
    this.name,
    this.description,
    this.tooltip,
    this.maxrank,
    this.cooldown,
    this.cooldownBurn,
    this.cost,
    this.costBurn,
    this.effect,
    this.effectBurn,
    this.vars,
    this.key,
    this.summonerLevel,
    this.modes,
    this.maxammo,
    this.range,
    this.rangeBurn,
    this.image,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? tooltip;
  final int? maxrank;
  final List<int?>? cooldown;
  final String? cooldownBurn;
  final List<int?>? cost;
  final String? costBurn;
  final List<List<double?>?>? effect;
  final List<String?>? effectBurn;
  final List<dynamic>? vars;
  final String? key;
  final int? summonerLevel;
  final List<String?>? modes;
  final String? maxammo;
  final List<int?>? range;
  final String? rangeBurn;
  final ImageModel? image;

  factory DatumModel.fromJson(String str) =>
      DatumModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumModel.fromMap(Map<String, dynamic> json) => DatumModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        maxrank: json["maxrank"],
        cooldown: List<int>.from(json["cooldown"].map((x) => x)),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        effect: List<List<double>>.from(json["effect"].map((x) =>
            x == null ? null : List<double>.from(x.map((x) => x.toDouble())))),
        effectBurn: List<String>.from(json["effectBurn"].map((x) => x)),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        key: json["key"],
        summonerLevel: json["summonerLevel"],
        modes: List<String>.from(json["modes"].map((x) => x)),
        maxammo: json["maxammo"],
        range: List<int>.from(json["range"].map((x) => x)),
        rangeBurn: json["rangeBurn"],
        image: ImageModel.fromMap(json["image"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "maxrank": maxrank,
        "cooldown": List<dynamic>.from(cooldown!.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": List<dynamic>.from(cost!.map((x) => x)),
        "costBurn": costBurn,
        "effect": List<dynamic>.from(effect!.map(
            (x) => x == null ? null : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn": List<dynamic>.from(effectBurn!.map((x) => x)),
        "vars": List<dynamic>.from(vars!.map((x) => x)),
        "key": key,
        "summonerLevel": summonerLevel,
        "modes": List<dynamic>.from(modes!.map((x) => x)),
        "maxammo": maxammo,
        "range": List<dynamic>.from(range!.map((x) => x)),
        "rangeBurn": rangeBurn,
        "image": image!.toMap(),
      };
}
