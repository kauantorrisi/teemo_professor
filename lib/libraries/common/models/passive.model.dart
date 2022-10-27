import 'dart:convert';

class PassiveModel {
  PassiveModel({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  factory PassiveModel.fromJson(String str) =>
      PassiveModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PassiveModel.fromMap(Map<String, dynamic> json) => PassiveModel(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
      };
}
