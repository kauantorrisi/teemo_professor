import 'dart:convert';

class SummonerModel {
  SummonerModel({
    this.id,
    this.accountId,
    this.puuid,
    this.name,
    this.profileIconId,
    this.revisionDate,
    this.summonerLevel,
  });

  final String? id;
  final String? accountId;
  final String? puuid;
  final String? name;
  final int? profileIconId;
  final int? revisionDate;
  final int? summonerLevel;

  factory SummonerModel.fromJson(String str) =>
      SummonerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SummonerModel.fromMap(Map<String, dynamic> json) => SummonerModel(
        id: json["id"],
        accountId: json["accountId"],
        puuid: json["puuid"],
        name: json["name"],
        profileIconId: json["profileIconId"],
        revisionDate: json["revisionDate"],
        summonerLevel: json["summonerLevel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "accountId": accountId,
        "puuid": puuid,
        "name": name,
        "profileIconId": profileIconId,
        "revisionDate": revisionDate,
        "summonerLevel": summonerLevel,
      };
}
