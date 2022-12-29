import 'package:dio/dio.dart';

import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/match.model.dart';
import 'package:teemo_professor/libraries/common/models/spell.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';

class SummonerService {
  final Dio dio = Dio();

  Future<SummonerModel> getSummonerByName(String summonerName) async {
    SummonerModel summoner;
    Response response = await dio.get(LOL_SUMMONERBYNAME + summonerName,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    summoner = SummonerModel.fromMap(result);
    return summoner;
  }

  Future<SummonerModel> getSummonerByPUUID(String puuid) async {
    SummonerModel summoner;
    Response response = await dio.get(LOL_SUMMONERBYPUUID + puuid,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    summoner = SummonerModel.fromMap(result);
    return summoner;
  }

  Future<List<EntryModel>> getSummonerRankedInfo(
    String summonerId,
  ) async {
    List<EntryModel> rankedsInfo = [];
    Response response = await dio.get(LOL_SUMMONERRANKEDINFO + summonerId,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntrie in results) {
      rankedsInfo.add(EntryModel.fromMap(rankedEntrie));
    }
    return rankedsInfo;
  }

  Future<int> getSummonerTotalMasteryPoints(String summonerId) async {
    int totalMasteryPoints;
    Response response = await dio.get(
        LOL_SUMMONERTOTALMATERYPOINTS + summonerId,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    int result = response.data;
    totalMasteryPoints = result;
    return totalMasteryPoints;
  }

  Future<dynamic> getListMatchIdsBySummonerPuuid(String puuid) async {
    dynamic lastMatchId;
    Response response = await dio.get(
        '$LOL_LISTMATCHIDSBYPUUID$puuid/ids?start=0&count=10',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    lastMatchId = results;
    return lastMatchId;
  }

  Future<MatchModel> getMatchById(String matchId) async {
    MatchModel match;
    Response response = await dio.get(LOL_MATCHBYID + matchId,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    var result = response.data;
    match = MatchModel.fromMap(result);
    return match;
  }

  Future<List<SpellModel>> fetchSpells() async {
    List<SpellModel> spells = [];
    Response response = await dio.get(URL_SUMMONERSPELLS);
    Map results = response.data["data"];
    results.forEach((key, value) {
      spells.add(SpellModel.fromMap(value));
    });
    return spells;
  }
}
