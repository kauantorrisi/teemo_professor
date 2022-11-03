import 'dart:convert';

class ChampionsMasteryModel {
  ChampionsMasteryModel({
    this.championId,
    this.championLevel,
    this.championPoints,
    this.lastPlayTime,
    this.championPointsSinceLastLevel,
    this.championPointsUntilNextLevel,
    this.chestGranted,
    this.tokensEarned,
  });

  final int? championId;
  final int? championLevel;
  final int? championPoints;
  final int? lastPlayTime;
  final int? championPointsSinceLastLevel;
  final int? championPointsUntilNextLevel;
  final bool? chestGranted;
  final int? tokensEarned;

  factory ChampionsMasteryModel.fromJson(String str) =>
      ChampionsMasteryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChampionsMasteryModel.fromMap(Map<String, dynamic> json) =>
      ChampionsMasteryModel(
        championId: json["championId"],
        championLevel: json["championLevel"],
        championPoints: json["championPoints"],
        lastPlayTime: json["lastPlayTime"],
        championPointsSinceLastLevel: json["championPointsSinceLastLevel"],
        championPointsUntilNextLevel: json["championPointsUntilNextLevel"],
        chestGranted: json["chestGranted"],
        tokensEarned: json["tokensEarned"],
      );

  Map<String, dynamic> toMap() => {
        "championId": championId,
        "championLevel": championLevel,
        "championPoints": championPoints,
        "lastPlayTime": lastPlayTime,
        "championPointsSinceLastLevel": championPointsSinceLastLevel,
        "championPointsUntilNextLevel": championPointsUntilNextLevel,
        "chestGranted": chestGranted,
        "tokensEarned": tokensEarned,
      };
}
