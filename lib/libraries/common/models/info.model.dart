import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/models/team.model.dart';

class InfoModel {
  InfoModel({
    this.gameCreation,
    this.gameDuration,
    this.gameEndTimestamp,
    this.gameId,
    this.gameMode,
    this.gameName,
    this.gameStartTimestamp,
    this.gameType,
    this.gameVersion,
    this.mapId,
    this.participants,
    this.platformId,
    this.queueId,
    this.teams,
    this.tournamentCode,
  });

  final int? gameCreation;
  final int? gameDuration;
  final int? gameEndTimestamp;
  final int? gameId;
  final String? gameMode;
  final String? gameName;
  final int? gameStartTimestamp;
  final String? gameType;
  final String? gameVersion;
  final int? mapId;
  final List<ParticipantModel?>? participants;
  final String? platformId;
  final int? queueId;
  final List<TeamModel>? teams;
  final String? tournamentCode;

  factory InfoModel.fromJson(String str) => InfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        gameCreation: json["gameCreation"],
        gameDuration: json["gameDuration"],
        gameEndTimestamp: json["gameEndTimestamp"],
        gameId: json["gameId"],
        gameMode: json["gameMode"],
        gameName: json["gameName"],
        gameStartTimestamp: json["gameStartTimestamp"],
        gameType: json["gameType"],
        gameVersion: json["gameVersion"],
        mapId: json["mapId"],
        participants: json["participants"] == null
            ? null
            : List<ParticipantModel>.from(
                json["participants"].map((x) => ParticipantModel.fromMap(x))),
        platformId: json["platformId"],
        queueId: json["queueId"],
        teams: json["teams"] == null
            ? null
            : List<TeamModel>.from(
                json["teams"].map((x) => TeamModel.fromMap(x))),
        tournamentCode: json["tournamentCode"],
      );

  Map<String, dynamic> toMap() => {
        "gameCreation": gameCreation,
        "gameDuration": gameDuration,
        "gameEndTimestamp": gameEndTimestamp,
        "gameId": gameId,
        "gameMode": gameMode,
        "gameName": gameName,
        "gameStartTimestamp": gameStartTimestamp,
        "gameType": gameType,
        "gameVersion": gameVersion,
        "mapId": mapId,
        "participants": participants == null
            ? null
            : List<dynamic>.from(participants!.map((x) => x!.toMap())),
        "platformId": platformId,
        "queueId": queueId,
        "teams": teams == null
            ? null
            : List<dynamic>.from(teams!.map((x) => x.toMap())),
        "tournamentCode": tournamentCode,
      };
}
