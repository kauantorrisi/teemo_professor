import 'package:dio/dio.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/models/champions_matery.model.dart';
import 'package:teemo_professor/libraries/common/models/match/match.model.dart';
import 'package:teemo_professor/libraries/common/models/ranked_info.model.dart';
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

  Future<RankedInfoModel> getSummonerRankedInfo(
    String summonerId,
  ) async {
    RankedInfoModel rankedInfo;
    Response response = await dio.get(LOL_SUMMONERRANKEDINFO + summonerId,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data[0];
    rankedInfo = RankedInfoModel.fromMap(result);
    return rankedInfo;
  }

  Future<List<ChampionsMasteryModel>> getChampionMastery(
    String summonerId,
  ) async {
    List<ChampionsMasteryModel> championsMastery = [];
    Response response = await dio.get(
        '$LOL_SUMMONERCHAMPIONSMATERYBYID$summonerId/top',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var champion in results) {
      championsMastery.add(ChampionsMasteryModel.fromMap(champion));
    }
    return championsMastery;
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

  Future<List<dynamic>> getListMatchIdsByPuuid(String puuid) async {
    List<dynamic> matchIds;
    Response response = await dio.get(
        '$LOL_LISTMATCHIDSBYPUUID$puuid/ids?start=0&count=20',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    matchIds = results;
    return matchIds;
  }

  Future<MatchModel> getMatchMetadataById(String matchId) async {
    MatchModel match;
    Response response = await dio.get(LOL_MATCHBYID + matchId,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    var result = response.data;
    match = MatchModel.fromMap(result);
    return match;
  }
}
