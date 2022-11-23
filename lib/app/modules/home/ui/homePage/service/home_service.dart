import 'package:dio/dio.dart';

import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/match.model.dart';
import 'package:teemo_professor/libraries/common/models/ranked.model.dart';
import 'package:teemo_professor/libraries/common/models/spell.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';

class HomeService {
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
        '$LOL_LISTMATCHIDSBYPUUID$puuid/ids?start=0&count=20',
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

  Future<RankedModel> getRankedChallengerSoloQInfo() async {
    RankedModel rankedChallengerSoloQInfo;
    Response response = await dio.get(LOL_RANKEDCHALLENGERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedChallengerSoloQInfo = RankedModel.fromMap(result);
    return rankedChallengerSoloQInfo;
  }

  Future<RankedModel> getRankedChallengerFlexInfo() async {
    RankedModel rankedChallengerFlexInfo;
    Response response = await dio.get(LOL_RANKEDCHALLENGERFLEXINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedChallengerFlexInfo = RankedModel.fromMap(result);
    return rankedChallengerFlexInfo;
  }

  Future<RankedModel> getRankedGrandMasterSoloQInfo() async {
    RankedModel rankedGrandmasterSoloQInfo;
    Response response = await dio.get(LOL_RANKEDGRANDMASTERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedGrandmasterSoloQInfo = RankedModel.fromMap(result);
    return rankedGrandmasterSoloQInfo;
  }

  Future<RankedModel> getRankedGrandMasterFlexInfo() async {
    RankedModel rankedGrandmasterFlexInfo;
    Response response = await dio.get(LOL_RANKEDGRANDMASTERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedGrandmasterFlexInfo = RankedModel.fromMap(result);
    return rankedGrandmasterFlexInfo;
  }

  Future<RankedModel> getRankedMasterSoloQInfo() async {
    RankedModel rankedMasterSoloQInfo;
    Response response = await dio.get(LOL_RANKEDMASTERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedMasterSoloQInfo = RankedModel.fromMap(result);
    return rankedMasterSoloQInfo;
  }

  Future<RankedModel> getRankedMasterFlexInfo() async {
    RankedModel rankedMasterFlexInfo;
    Response response = await dio.get(LOL_RANKEDMASTERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedMasterFlexInfo = RankedModel.fromMap(result);
    return rankedMasterFlexInfo;
  }

  Future<RankedModel> getRankedDiamondSoloQInfo({required String? tier}) async {
    RankedModel rankedDiamondSoloQInfo;
    Response response = await dio.get('$LOL_RANKEDDIAMONDSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedDiamondSoloQInfo = RankedModel.fromMap(result);
    return rankedDiamondSoloQInfo;
  }

  Future<RankedModel> getRankedDiamondFlexInfo({required String? tier}) async {
    RankedModel rankedDiamondFlexInfo;
    Response response = await dio.get('$LOL_RANKEDDIAMONDFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedDiamondFlexInfo = RankedModel.fromMap(result);
    return rankedDiamondFlexInfo;
  }
}
