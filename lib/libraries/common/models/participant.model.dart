import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/perks.model.dart';

class ParticipantModel {
  ParticipantModel({
    this.assists,
    this.baronKills,
    this.basicPings,
    this.bountyLevel,
    this.challenges,
    this.champExperience,
    this.champLevel,
    this.championId,
    this.championName,
    this.championTransform,
    this.consumablesPurchased,
    this.damageDealtToBuildings,
    this.damageDealtToObjectives,
    this.damageDealtToTurrets,
    this.damageSelfMitigated,
    this.deaths,
    this.detectorWardsPlaced,
    this.doubleKills,
    this.dragonKills,
    this.eligibleForProgression,
    this.firstBloodAssist,
    this.firstBloodKill,
    this.firstTowerAssist,
    this.firstTowerKill,
    this.gameEndedInEarlySurrender,
    this.gameEndedInSurrender,
    this.goldEarned,
    this.goldSpent,
    this.individualPosition,
    this.inhibitorKills,
    this.inhibitorTakedowns,
    this.inhibitorsLost,
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.itemsPurchased,
    this.killingSprees,
    this.kills,
    this.lane,
    this.largestCriticalStrike,
    this.largestKillingSpree,
    this.largestMultiKill,
    this.longestTimeSpentLiving,
    this.magicDamageDealt,
    this.magicDamageDealtToChampions,
    this.magicDamageTaken,
    this.neutralMinionsKilled,
    this.nexusKills,
    this.nexusLost,
    this.nexusTakedowns,
    this.objectivesStolen,
    this.objectivesStolenAssists,
    this.participantId,
    this.pentaKills,
    this.perks,
    this.physicalDamageDealt,
    this.physicalDamageDealtToChampions,
    this.physicalDamageTaken,
    this.profileIcon,
    this.puuid,
    this.quadraKills,
    this.riotIdName,
    this.riotIdTagline,
    this.role,
    this.sightWardsBoughtInGame,
    this.spell1Casts,
    this.spell2Casts,
    this.spell3Casts,
    this.spell4Casts,
    this.summoner1Casts,
    this.summoner1Id,
    this.summoner2Casts,
    this.summoner2Id,
    this.summonerId,
    this.summonerLevel,
    this.summonerName,
    this.teamEarlySurrendered,
    this.teamId,
    this.teamPosition,
    this.timeCCingOthers,
    this.timePlayed,
    this.totalDamageDealt,
    this.totalDamageDealtToChampions,
    this.totalDamageShieldedOnTeammates,
    this.totalDamageTaken,
    this.totalHeal,
    this.totalHealsOnTeammates,
    this.totalMinionsKilled,
    this.totalTimeCcDealt,
    this.totalTimeSpentDead,
    this.totalUnitsHealed,
    this.tripleKills,
    this.trueDamageDealt,
    this.trueDamageDealtToChampions,
    this.trueDamageTaken,
    this.turretKills,
    this.turretTakedowns,
    this.turretsLost,
    this.unrealKills,
    this.visionScore,
    this.visionWardsBoughtInGame,
    this.wardsKilled,
    this.wardsPlaced,
    this.win,
  });

  final int? assists;
  final int? baronKills;
  final int? basicPings;
  final int? bountyLevel;
  final Map<String?, dynamic>? challenges;
  final int? champExperience;
  final int? champLevel;
  final int? championId;
  final String? championName;
  final int? championTransform;
  final int? consumablesPurchased;
  final int? damageDealtToBuildings;
  final int? damageDealtToObjectives;
  final int? damageDealtToTurrets;
  final int? damageSelfMitigated;
  final int? deaths;
  final int? detectorWardsPlaced;
  final int? doubleKills;
  final int? dragonKills;
  final bool? eligibleForProgression;
  final bool? firstBloodAssist;
  final bool? firstBloodKill;
  final bool? firstTowerAssist;
  final bool? firstTowerKill;
  final bool? gameEndedInEarlySurrender;
  final bool? gameEndedInSurrender;
  final int? goldEarned;
  final int? goldSpent;
  final String? individualPosition;
  final int? inhibitorKills;
  final int? inhibitorTakedowns;
  final int? inhibitorsLost;
  final int? item0;
  final int? item1;
  final int? item2;
  final int? item3;
  final int? item4;
  final int? item5;
  final int? item6;
  final int? itemsPurchased;
  final int? killingSprees;
  final int? kills;
  final String? lane;
  final int? largestCriticalStrike;
  final int? largestKillingSpree;
  final int? largestMultiKill;
  final int? longestTimeSpentLiving;
  final int? magicDamageDealt;
  final int? magicDamageDealtToChampions;
  final int? magicDamageTaken;
  final int? neutralMinionsKilled;
  final int? nexusKills;
  final int? nexusLost;
  final int? nexusTakedowns;
  final int? objectivesStolen;
  final int? objectivesStolenAssists;
  final int? participantId;
  final int? pentaKills;
  final PerksModel? perks;
  final int? physicalDamageDealt;
  final int? physicalDamageDealtToChampions;
  final int? physicalDamageTaken;
  final int? profileIcon;
  final String? puuid;
  final int? quadraKills;
  final String? riotIdName;
  final String? riotIdTagline;
  final String? role;
  final int? sightWardsBoughtInGame;
  final int? spell1Casts;
  final int? spell2Casts;
  final int? spell3Casts;
  final int? spell4Casts;
  final int? summoner1Casts;
  final int? summoner1Id;
  final int? summoner2Casts;
  final int? summoner2Id;
  final String? summonerId;
  final int? summonerLevel;
  final String? summonerName;
  final bool? teamEarlySurrendered;
  final int? teamId;
  final String? teamPosition;
  final int? timeCCingOthers;
  final int? timePlayed;
  final int? totalDamageDealt;
  final int? totalDamageDealtToChampions;
  final int? totalDamageShieldedOnTeammates;
  final int? totalDamageTaken;
  final int? totalHeal;
  final int? totalHealsOnTeammates;
  final int? totalMinionsKilled;
  final int? totalTimeCcDealt;
  final int? totalTimeSpentDead;
  final int? totalUnitsHealed;
  final int? tripleKills;
  final int? trueDamageDealt;
  final int? trueDamageDealtToChampions;
  final int? trueDamageTaken;
  final int? turretKills;
  final int? turretTakedowns;
  final int? turretsLost;
  final int? unrealKills;
  final int? visionScore;
  final int? visionWardsBoughtInGame;
  final int? wardsKilled;
  final int? wardsPlaced;
  final bool? win;

  factory ParticipantModel.fromJson(String str) =>
      ParticipantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromMap(Map<String, dynamic> json) =>
      ParticipantModel(
        assists: json["assists"],
        baronKills: json["baronKills"],
        basicPings: json["basicPings"],
        bountyLevel: json["bountyLevel"],
        challenges: json["challenges"] == null
            ? null
            : Map.from(json["challenges"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        champExperience: json["champExperience"],
        champLevel: json["champLevel"],
        championId: json["championId"],
        championName: json["championName"],
        championTransform: json["championTransform"],
        consumablesPurchased: json["consumablesPurchased"],
        damageDealtToBuildings: json["damageDealtToBuildings"],
        damageDealtToObjectives: json["damageDealtToObjectives"],
        damageDealtToTurrets: json["damageDealtToTurrets"],
        damageSelfMitigated: json["damageSelfMitigated"],
        deaths: json["deaths"],
        detectorWardsPlaced: json["detectorWardsPlaced"],
        doubleKills: json["doubleKills"],
        dragonKills: json["dragonKills"],
        eligibleForProgression: json["eligibleForProgression"],
        firstBloodAssist: json["firstBloodAssist"],
        firstBloodKill: json["firstBloodKill"],
        firstTowerAssist: json["firstTowerAssist"],
        firstTowerKill: json["firstTowerKill"],
        gameEndedInEarlySurrender: json["gameEndedInEarlySurrender"],
        gameEndedInSurrender: json["gameEndedInSurrender"],
        goldEarned: json["goldEarned"],
        goldSpent: json["goldSpent"],
        individualPosition: json["individualPosition"],
        inhibitorKills: json["inhibitorKills"],
        inhibitorTakedowns: json["inhibitorTakedowns"],
        inhibitorsLost: json["inhibitorsLost"],
        item0: json["item0"],
        item1: json["item1"],
        item2: json["item2"],
        item3: json["item3"],
        item4: json["item4"],
        item5: json["item5"],
        item6: json["item6"],
        itemsPurchased: json["itemsPurchased"],
        killingSprees: json["killingSprees"],
        kills: json["kills"],
        lane: json["lane"],
        largestCriticalStrike: json["largestCriticalStrike"],
        largestKillingSpree: json["largestKillingSpree"],
        largestMultiKill: json["largestMultiKill"],
        longestTimeSpentLiving: json["longestTimeSpentLiving"],
        magicDamageDealt: json["magicDamageDealt"],
        magicDamageDealtToChampions: json["magicDamageDealtToChampions"],
        magicDamageTaken: json["magicDamageTaken"],
        neutralMinionsKilled: json["neutralMinionsKilled"],
        nexusKills: json["nexusKills"],
        nexusLost: json["nexusLost"],
        nexusTakedowns: json["nexusTakedowns"],
        objectivesStolen: json["objectivesStolen"],
        objectivesStolenAssists: json["objectivesStolenAssists"],
        participantId: json["participantId"],
        pentaKills: json["pentaKills"],
        perks: json["perks"] == null ? null : PerksModel.fromMap(json["perks"]),
        physicalDamageDealt: json["physicalDamageDealt"],
        physicalDamageDealtToChampions: json["physicalDamageDealtToChampions"],
        physicalDamageTaken: json["physicalDamageTaken"],
        profileIcon: json["profileIcon"],
        puuid: json["puuid"],
        quadraKills: json["quadraKills"],
        riotIdName: json["riotIdName"],
        riotIdTagline: json["riotIdTagline"],
        role: json["role"],
        sightWardsBoughtInGame: json["sightWardsBoughtInGame"],
        spell1Casts: json["spell1Casts"],
        spell2Casts: json["spell2Casts"],
        spell3Casts: json["spell3Casts"],
        spell4Casts: json["spell4Casts"],
        summoner1Casts: json["summoner1Casts"],
        summoner1Id: json["summoner1Id"],
        summoner2Casts: json["summoner2Casts"],
        summoner2Id: json["summoner2Id"],
        summonerId: json["summonerId"],
        summonerLevel: json["summonerLevel"],
        summonerName: json["summonerName"],
        teamEarlySurrendered: json["teamEarlySurrendered"],
        teamId: json["teamId"],
        teamPosition: json["teamPosition"],
        timeCCingOthers: json["timeCCingOthers"],
        timePlayed: json["timePlayed"],
        totalDamageDealt: json["totalDamageDealt"],
        totalDamageDealtToChampions: json["totalDamageDealtToChampions"],
        totalDamageShieldedOnTeammates: json["totalDamageShieldedOnTeammates"],
        totalDamageTaken: json["totalDamageTaken"],
        totalHeal: json["totalHeal"],
        totalHealsOnTeammates: json["totalHealsOnTeammates"],
        totalMinionsKilled: json["totalMinionsKilled"],
        totalTimeCcDealt: json["totalTimeCCDealt"],
        totalTimeSpentDead: json["totalTimeSpentDead"],
        totalUnitsHealed: json["totalUnitsHealed"],
        tripleKills: json["tripleKills"],
        trueDamageDealt: json["trueDamageDealt"],
        trueDamageDealtToChampions: json["trueDamageDealtToChampions"],
        trueDamageTaken: json["trueDamageTaken"],
        turretKills: json["turretKills"],
        turretTakedowns: json["turretTakedowns"],
        turretsLost: json["turretsLost"],
        unrealKills: json["unrealKills"],
        visionScore: json["visionScore"],
        visionWardsBoughtInGame: json["visionWardsBoughtInGame"],
        wardsKilled: json["wardsKilled"],
        wardsPlaced: json["wardsPlaced"],
        win: json["win"],
      );

  Map<String, dynamic> toMap() => {
        "assists": assists,
        "baronKills": baronKills,
        "basicPings": basicPings,
        "bountyLevel": bountyLevel,
        "challenges": challenges == null
            ? null
            : Map.from(challenges!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "champExperience": champExperience,
        "champLevel": champLevel,
        "championId": championId,
        "championName": championName,
        "championTransform": championTransform,
        "consumablesPurchased": consumablesPurchased,
        "damageDealtToBuildings": damageDealtToBuildings,
        "damageDealtToObjectives": damageDealtToObjectives,
        "damageDealtToTurrets": damageDealtToTurrets,
        "damageSelfMitigated": damageSelfMitigated,
        "deaths": deaths,
        "detectorWardsPlaced": detectorWardsPlaced,
        "doubleKills": doubleKills,
        "dragonKills": dragonKills,
        "eligibleForProgression": eligibleForProgression,
        "firstBloodAssist": firstBloodAssist,
        "firstBloodKill": firstBloodKill,
        "firstTowerAssist": firstTowerAssist,
        "firstTowerKill": firstTowerKill,
        "gameEndedInEarlySurrender": gameEndedInEarlySurrender,
        "gameEndedInSurrender": gameEndedInSurrender,
        "goldEarned": goldEarned,
        "goldSpent": goldSpent,
        "individualPosition": individualPosition,
        "inhibitorKills": inhibitorKills,
        "inhibitorTakedowns": inhibitorTakedowns,
        "inhibitorsLost": inhibitorsLost,
        "item0": item0,
        "item1": item1,
        "item2": item2,
        "item3": item3,
        "item4": item4,
        "item5": item5,
        "item6": item6,
        "itemsPurchased": itemsPurchased,
        "killingSprees": killingSprees,
        "kills": kills,
        "lane": lane,
        "largestCriticalStrike": largestCriticalStrike,
        "largestKillingSpree": largestKillingSpree,
        "largestMultiKill": largestMultiKill,
        "longestTimeSpentLiving": longestTimeSpentLiving,
        "magicDamageDealt": magicDamageDealt,
        "magicDamageDealtToChampions": magicDamageDealtToChampions,
        "magicDamageTaken": magicDamageTaken,
        "neutralMinionsKilled": neutralMinionsKilled,
        "nexusKills": nexusKills,
        "nexusLost": nexusLost,
        "nexusTakedowns": nexusTakedowns,
        "objectivesStolen": objectivesStolen,
        "objectivesStolenAssists": objectivesStolenAssists,
        "participantId": participantId,
        "pentaKills": pentaKills,
        "perks": perks == null ? null : perks!.toMap(),
        "physicalDamageDealt": physicalDamageDealt,
        "physicalDamageDealtToChampions": physicalDamageDealtToChampions,
        "physicalDamageTaken": physicalDamageTaken,
        "profileIcon": profileIcon,
        "puuid": puuid,
        "quadraKills": quadraKills,
        "riotIdName": riotIdName,
        "riotIdTagline": riotIdTagline,
        "role": role,
        "sightWardsBoughtInGame": sightWardsBoughtInGame,
        "spell1Casts": spell1Casts,
        "spell2Casts": spell2Casts,
        "spell3Casts": spell3Casts,
        "spell4Casts": spell4Casts,
        "summoner1Casts": summoner1Casts,
        "summoner1Id": summoner1Id,
        "summoner2Casts": summoner2Casts,
        "summoner2Id": summoner2Id,
        "summonerId": summonerId,
        "summonerLevel": summonerLevel,
        "summonerName": summonerName,
        "teamEarlySurrendered": teamEarlySurrendered,
        "teamId": teamId,
        "teamPosition": teamPosition,
        "timeCCingOthers": timeCCingOthers,
        "timePlayed": timePlayed,
        "totalDamageDealt": totalDamageDealt,
        "totalDamageDealtToChampions": totalDamageDealtToChampions,
        "totalDamageShieldedOnTeammates": totalDamageShieldedOnTeammates,
        "totalDamageTaken": totalDamageTaken,
        "totalHeal": totalHeal,
        "totalHealsOnTeammates": totalHealsOnTeammates,
        "totalMinionsKilled": totalMinionsKilled,
        "totalTimeCCDealt": totalTimeCcDealt,
        "totalTimeSpentDead": totalTimeSpentDead,
        "totalUnitsHealed": totalUnitsHealed,
        "tripleKills": tripleKills,
        "trueDamageDealt": trueDamageDealt,
        "trueDamageDealtToChampions": trueDamageDealtToChampions,
        "trueDamageTaken": trueDamageTaken,
        "turretKills": turretKills,
        "turretTakedowns": turretTakedowns,
        "turretsLost": turretsLost,
        "unrealKills": unrealKills,
        "visionScore": visionScore,
        "visionWardsBoughtInGame": visionWardsBoughtInGame,
        "wardsKilled": wardsKilled,
        "wardsPlaced": wardsPlaced,
        "win": win,
      };
}
