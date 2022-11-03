import 'dart:convert';

class RankedInfoModel {
  RankedInfoModel({
    this.leagueId,
    this.queueType,
    this.tier,
    this.rank,
    this.summonerId,
    this.summonerName,
    this.leaguePoints,
    this.wins,
    this.losses,
    this.veteran,
    this.inactive,
    this.freshBlood,
    this.hotStreak,
  });

  final String? leagueId;
  final String? queueType;
  final String? tier;
  final String? rank;
  final String? summonerId;
  final String? summonerName;
  final int? leaguePoints;
  final int? wins;
  final int? losses;
  final bool? veteran;
  final bool? inactive;
  final bool? freshBlood;
  final bool? hotStreak;

  factory RankedInfoModel.fromJson(String str) =>
      RankedInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankedInfoModel.fromMap(Map<String, dynamic> json) => RankedInfoModel(
        leagueId: json["leagueId"],
        queueType: json["queueType"],
        tier: json["tier"],
        rank: json["rank"],
        summonerId: json["summonerId"],
        summonerName: json["summonerName"],
        leaguePoints: json["leaguePoints"],
        wins: json["wins"],
        losses: json["losses"],
        veteran: json["veteran"],
        inactive: json["inactive"],
        freshBlood: json["freshBlood"],
        hotStreak: json["hotStreak"],
      );

  Map<String, dynamic> toMap() => {
        "leagueId": leagueId,
        "queueType": queueType,
        "tier": tier,
        "rank": rank,
        "summonerId": summonerId,
        "summonerName": summonerName,
        "leaguePoints": leaguePoints,
        "wins": wins,
        "losses": losses,
        "veteran": veteran,
        "inactive": inactive,
        "freshBlood": freshBlood,
        "hotStreak": hotStreak,
      };
}
