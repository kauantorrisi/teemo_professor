// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teemo_professor/libraries/common/models/champions_matery.model.dart';
import 'package:teemo_professor/libraries/common/models/match/match.model.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/ranked.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';
import 'package:teemo_professor/app/modules/summoner/service/summoner_service.dart';
part 'summoner_store.g.dart';

class SummonerStore = _SummonerStoreBase with _$SummonerStore;

abstract class _SummonerStoreBase with Store {
  final TextEditingController searchController = TextEditingController();
  final SummonerService service = Modular.get();

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  SummonerModel? summonerByName;

  @observable
  SummonerModel? summonerByPuuid;

  @observable
  EntryModel? entriesInfo;

  @observable
  RankedModel? rankedChallengerSoloQInfo;

  @observable
  MatchModel? match;

  @observable
  int? totalMasteryPoints;

  @observable
  ObservableList<ChampionsMasteryModel> championsMastery = ObservableList();

  @observable
  ObservableList<dynamic> matchIds = ObservableList();

  @action
  setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  Future<void> initState() async {
    await getRankedChallengerSoloQInfo();
  }

  @action
  Future<void> onSearch() async {
    try {
      setIsLoading(true);
      setIsError(false);
      await getSummonerByName();
      await getSummonerSummonerRankedInfo('${summonerByName?.id}');
      await getSummonerTotalMasteryPoints('${summonerByName?.id}');
      // await getTopChampionsMastery('${summonerByName?.id}');
      // await getListMatchIds('${summonerByName?.puuid}');
      // await getMatchById();
      // await getSummonerByPUUID('${match?.metadata?.participants?.first}');
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSummonerByName() async {
    try {
      setIsLoading(true);
      setIsError(false);
      summonerByName = SummonerModel();
      summonerByName = await service.getSummonerByName(searchController.text);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSummonerByPUUID(String puuid) async {
    try {
      setIsLoading(true);
      setIsError(false);
      summonerByPuuid = SummonerModel();
      summonerByPuuid = await service.getSummonerByPUUID(puuid);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSummonerSummonerRankedInfo(String summonerId) async {
    try {
      setIsLoading(true);
      setIsError(false);
      entriesInfo = EntryModel();
      entriesInfo = await service.getSummonerRankedInfo(summonerId);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getTopChampionsMastery(String summonerId) async {
    try {
      setIsLoading(true);
      setIsError(false);
      championsMastery = ObservableList();
      championsMastery.addAll(await service.getTopChampionsMastery(summonerId));
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSummonerTotalMasteryPoints(String summonerId) async {
    try {
      setIsLoading(true);
      setIsError(false);
      totalMasteryPoints = 0;
      totalMasteryPoints =
          await service.getSummonerTotalMasteryPoints(summonerId);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getListMatchIds(String puuid) async {
    try {
      setIsLoading(true);
      setIsError(false);
      matchIds = ObservableList();
      matchIds.addAll(await service.getListMatchIdsByPuuid(puuid));
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getMatchById() async {
    try {
      setIsLoading(true);
      setIsError(false);
      match = MatchModel();
      match = await service.getMatchById(matchIds.first);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  Future<void> getRankedChallengerSoloQInfo() async {
    try {
      setIsLoading(true);
      setIsError(false);
      rankedChallengerSoloQInfo = RankedModel();
      rankedChallengerSoloQInfo = await service.getRankedChallengerSoloQInfo();
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}
