import 'dart:convert';
import 'package:teemo_professor/libraries/common/models/match/ban.model.dart';
import 'package:teemo_professor/libraries/common/models/match/objectives.model.dart';

class TeamModel {
  TeamModel({
    this.bans,
    this.objectives,
    this.teamId,
    this.win,
  });

  final List<BanModel?>? bans;
  final ObjectivesModel? objectives;
  final int? teamId;
  final bool? win;

  factory TeamModel.fromJson(String str) => TeamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamModel.fromMap(Map<String, dynamic> json) => TeamModel(
        bans: json["bans"] == null
            ? null
            : List<BanModel>.from(json["bans"].map((x) => BanModel.fromMap(x))),
        objectives: json["objectives"] == null
            ? null
            : ObjectivesModel.fromMap(json["objectives"]),
        teamId: json["teamId"],
        win: json["win"],
      );

  Map<String, dynamic> toMap() => {
        "bans": bans == null
            ? null
            : List<dynamic>.from(bans!.map((x) => x!.toMap())),
        "objectives": objectives == null ? null : objectives!.toMap(),
        "teamId": teamId,
        "win": win,
      };
}
