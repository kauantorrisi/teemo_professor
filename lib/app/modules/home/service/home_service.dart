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
    for (var rankedEntry in results) {
      rankedsInfo.add(EntryModel.fromMap(rankedEntry));
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

  Future<List<EntryModel>> getRankedDiamondSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedDiamondSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDDIAMONDSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedDiamondSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedDiamondSoloQInfo;
  }

  Future<List<EntryModel>> getRankedDiamondFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedDiamondFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDDIAMONDFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedDiamondFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedDiamondFlexInfo;
  }

  Future<List<EntryModel>> getRankedPlatinumSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedPlatinumSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDPLATINUMSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedPlatinumSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedPlatinumSoloQInfo;
  }

  Future<List<EntryModel>> getRankedPlatinumFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedPlatinumFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDPLATINUMFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedPlatinumFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedPlatinumFlexInfo;
  }

  Future<List<EntryModel>> getRankedGoldSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedGoldSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDGOLDSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedGoldSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedGoldSoloQInfo;
  }

  Future<List<EntryModel>> getRankedGoldFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedGoldFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDGOLDFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedGoldFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedGoldFlexInfo;
  }

  Future<List<EntryModel>> getRankedSilverSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedSilverSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDSILVERSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedSilverSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedSilverSoloQInfo;
  }

  Future<List<EntryModel>> getRankedSilverFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedSilverFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDSILVERFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedSilverFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedSilverFlexInfo;
  }

  Future<List<EntryModel>> getRankedBronzeSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedBronzeSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDBRONZESOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedBronzeSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedBronzeSoloQInfo;
  }

  Future<List<EntryModel>> getRankedBronzeFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedBronzeFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDBRONZEFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedBronzeFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedBronzeFlexInfo;
  }

  Future<List<EntryModel>> getRankedIronSoloQInfo(
      {required String? tier}) async {
    List<EntryModel> rankedIronSoloQInfo = [];
    Response response = await dio.get('$LOL_RANKEDIRONSOLOQ$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedIronSoloQInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedIronSoloQInfo;
  }

  Future<List<EntryModel>> getRankedIronFlexInfo(
      {required String? tier}) async {
    List<EntryModel> rankedIronFlexInfo = [];
    Response response = await dio.get('$LOL_RANKEDIRONFLEX$tier?/page=1',
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    List<dynamic> results = response.data;
    for (var rankedEntry in results) {
      rankedIronFlexInfo.add(EntryModel.fromMap(rankedEntry));
    }
    return rankedIronFlexInfo;
  }
}
