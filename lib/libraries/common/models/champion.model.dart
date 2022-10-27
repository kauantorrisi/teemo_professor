import 'dart:convert';
import 'package:teemo_professor/libraries/common/models/image.model.dart';
import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/passive.model.dart';
import 'package:teemo_professor/libraries/common/models/skin.model.dart';
import 'package:teemo_professor/libraries/common/models/spell.model.dart';

class ChampionModel {
  ChampionModel({
    this.id,
    this.key,
    this.name,
    this.title,
    this.skins,
    this.lore,
    this.blurb,
    this.image,
    this.allytips,
    this.enemytips,
    this.tags,
    this.partype,
    this.info,
    this.stats,
    this.spells,
    this.passive,
    this.recommended,
  });

  final String? id;
  final String? key;
  final String? name;
  final String? title;
  final List<SkinModel>? skins;
  final String? lore;
  final String? blurb;
  final ImageModel? image;
  final List<String>? allytips;
  final List<String>? enemytips;
  final List<String>? tags;
  final String? partype;
  final InfoModel? info;
  final Map<String, double>? stats;
  final List<SpellModel>? spells;
  final PassiveModel? passive;
  final List<dynamic>? recommended;

  factory ChampionModel.fromJson(String str) =>
      ChampionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChampionModel.fromMap(Map<String, dynamic> json) => ChampionModel(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        skins: json["skins"] == null
            ? null
            : List<SkinModel>.from(
                json["skins"].map((x) => SkinModel.fromMap(x))),
        lore: json["lore"],
        blurb: json["blurb"],
        allytips: json["allytips"] == null
            ? null
            : List<String>.from(json["allytips"].map((x) => x)),
        enemytips: json["enemytips"] == null
            ? null
            : List<String>.from(json["enemytips"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        info: json["info"] == null ? null : InfoModel.fromMap(json["info"]),
        stats: json["stats"] == null
            ? null
            : Map.from(json["stats"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        spells: json["spells"] == null
            ? null
            : List<SpellModel>.from(
                json["spells"].map((x) => SpellModel.fromMap(x))),
        passive: json["passive"] == null
            ? null
            : PassiveModel.fromMap(json["passive"]),
        recommended: json["recommended"] == null
            ? null
            : List<dynamic>.from(json["recommended"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "skins": skins == null
            ? null
            : List<dynamic>.from(skins!.map((x) => x.toMap())),
        "lore": lore,
        "blurb": blurb,
        "allytips": allytips == null
            ? null
            : List<dynamic>.from(allytips!.map((x) => x)),
        "enemytips": enemytips == null
            ? null
            : List<dynamic>.from(enemytips!.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "partype": partype,
        "info": info == null ? null : info!.toMap(),
        "stats": stats == null
            ? null
            : Map.from(stats!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "spells": spells == null
            ? null
            : List<dynamic>.from(spells!.map((x) => x.toMap())),
        "passive": passive == null ? null : passive!.toMap(),
        "recommended": recommended == null
            ? null
            : List<dynamic>.from(recommended!.map((x) => x)),
      };
}
