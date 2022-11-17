import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/stat_perks.model.dart';
import 'package:teemo_professor/libraries/common/models/style.model.dart';

class PerksModel {
  PerksModel({
    this.statPerks,
    this.styles,
  });

  final StatPerksModel? statPerks;
  final List<StyleModel?>? styles;

  factory PerksModel.fromJson(String str) =>
      PerksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PerksModel.fromMap(Map<String, dynamic> json) => PerksModel(
        statPerks: json["statPerks"] == null
            ? null
            : StatPerksModel.fromMap(json["statPerks"]),
        styles: json["styles"] == null
            ? null
            : List<StyleModel>.from(
                json["styles"].map((x) => StyleModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statPerks": statPerks == null ? null : statPerks!.toMap(),
        "styles": styles == null
            ? null
            : List<dynamic>.from(styles!.map((x) => x!.toMap())),
      };
}
