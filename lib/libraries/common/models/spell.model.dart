import 'dart:convert';

class SpellModel {
  SpellModel({
    this.id,
    this.name,
    this.key,
    this.description,
    this.tooltip,
    this.maxrank,
    this.cooldown,
    this.cooldownBurn,
    this.cost,
    this.costBurn,
    this.effectBurn,
    this.vars,
    this.costType,
    this.maxammo,
    this.range,
    this.rangeBurn,
    this.resource,
  });

  final String? id;
  final String? name;
  final String? key;
  final String? description;
  final String? tooltip;
  final int? maxrank;
  final List<double>? cooldown;
  final String? cooldownBurn;
  final List<int>? cost;
  final String? costBurn;
  final List<String?>? effectBurn;
  final List<dynamic>? vars;
  final String? costType;
  final String? maxammo;
  final List<int>? range;
  final String? rangeBurn;
  final String? resource;

  factory SpellModel.fromJson(String str) =>
      SpellModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpellModel.fromMap(Map<String, dynamic> json) => SpellModel(
        id: json["id"],
        name: json["name"],
        key: json["key"],
        description: json["description"],
        tooltip: json["tooltip"],
        maxrank: json["maxrank"],
        cooldown: json["cooldown"] == null
            ? null
            : List<double>.from(json["cooldown"].map((x) => x.toDouble())),
        cooldownBurn: json["cooldownBurn"],
        cost: json["cost"] == null
            ? null
            : List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        effectBurn: json["effectBurn"] == null
            ? null
            : List<String?>.from(json["effectBurn"].map((x) => x)),
        vars: json["vars"] == null
            ? null
            : List<dynamic>.from(json["vars"].map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: json["range"] == null
            ? null
            : List<int>.from(json["range"].map((x) => x)),
        rangeBurn: json["rangeBurn"],
        resource: json["resource"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "key": key,
        "description": description,
        "tooltip": tooltip,
        "maxrank": maxrank,
        "cooldown": cooldown == null
            ? null
            : List<dynamic>.from(cooldown!.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": cost == null ? null : List<dynamic>.from(cost!.map((x) => x)),
        "costBurn": costBurn,
        "effectBurn": effectBurn == null
            ? null
            : List<dynamic>.from(effectBurn!.map((x) => x)),
        "vars": vars == null ? null : List<dynamic>.from(vars!.map((x) => x)),
        "costType": costType,
        "maxammo": maxammo,
        "range":
            range == null ? null : List<dynamic>.from(range!.map((x) => x)),
        "rangeBurn": rangeBurn,
        "resource": resource,
      };
}
