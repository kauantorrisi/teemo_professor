import 'dart:convert';
import 'package:teemo_professor/libraries/common/models/match/description.model.dart';
import 'package:teemo_professor/libraries/common/models/match/selection.model.dart';

class StyleModel {
  StyleModel({
    this.description,
    this.selections,
    this.style,
  });

  final DescriptionModel? description;
  final List<SelectionModel?>? selections;
  final int? style;

  factory StyleModel.fromJson(String str) =>
      StyleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StyleModel.fromMap(Map<String, dynamic> json) => StyleModel(
        description: json["description"] == null
            ? null
            : descriptionValues.map![json["description"]],
        selections: json["selections"] == null
            ? null
            : List<SelectionModel>.from(
                json["selections"].map((x) => SelectionModel.fromMap(x))),
        style: json["style"],
      );

  Map<String, dynamic> toMap() => {
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "selections": selections == null
            ? null
            : List<dynamic>.from(selections!.map((x) => x!.toMap())),
        "style": style,
      };
}
