import 'dart:convert';

class MetadataModel {
  MetadataModel({
    this.dataVersion,
    this.matchId,
    this.participants,
  });

  final String? dataVersion;
  final String? matchId;
  final List<String>? participants;

  factory MetadataModel.fromJson(String str) =>
      MetadataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetadataModel.fromMap(Map<String, dynamic> json) => MetadataModel(
        dataVersion: json["dataVersion"],
        matchId: json["matchId"],
        participants: json["participants"] == null
            ? null
            : List<String>.from(json["participants"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "dataVersion": dataVersion,
        "matchId": matchId,
        "participants": participants == null
            ? null
            : List<dynamic>.from(participants!.map((x) => x)),
      };
}
