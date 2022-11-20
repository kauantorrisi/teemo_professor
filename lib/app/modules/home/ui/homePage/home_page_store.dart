// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teemo_professor/app/modules/home/ui/homePage/service/home_service.dart';

import 'package:teemo_professor/libraries/common/models/champion.model.dart';
import 'package:teemo_professor/libraries/common/models/champions_mastery.model.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/match.model.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/models/ranked.model.dart';
import 'package:teemo_professor/libraries/common/models/spell.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';
part 'home_page_store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  final TextEditingController searchController = TextEditingController();
  final HomeService service = Modular.get();

  @observable
  bool? isLoading;

  @observable
  bool? isError;

  @observable
  bool isMySpell = false;

  @observable
  bool isMySecondSpell = false;

  @observable
  bool tappedSummonerRankedInfoIcon = false;

  @observable
  bool isFavorite = true;

  @observable
  SummonerModel? summonerByName;

  @observable
  MatchModel? match;

  @observable
  RankedModel? rankedChallengerSoloQInfo;

  @observable
  ObservableList<EntryModel?> entriesInfo = ObservableList();

  @observable
  ObservableList<ParticipantModel> me = ObservableList<ParticipantModel>();

  @observable
  ObservableList<String?> summonerSpellId = ObservableList<String?>();

  @observable
  ObservableList<String?> summonerSpellId2 = ObservableList<String?>();

  @observable
  ObservableList<ChampionsMasteryModel> championsMastery =
      ObservableList<ChampionsMasteryModel>();

  @observable
  ObservableList<dynamic> matchIds = ObservableList();

  @observable
  ObservableList<MatchModel?> matchs = ObservableList<MatchModel?>();

  @observable
  ObservableList<ChampionModel?> champions = ObservableList<ChampionModel?>();

  @observable
  ObservableList<SpellModel?> spells = ObservableList<SpellModel?>();

  @observable
  List<SummonerModel?> favoriteSummoners = [
    SummonerModel(
        name: 'Khons',
        profileIconId: 1455,
        summonerLevel: 487,
        accountId: 'jsiajsa978',
        id: 'uhs8888908',
        puuid: '8765tghjk',
        revisionDate: 1)
  ];

  @observable
  List<EntryModel> favoriteSummonersEntriesModel = [
    EntryModel(rank: 'SILVER', tier: '1')
  ];

  @action
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

  @action
  bool toggleArrowButton() =>
      tappedSummonerRankedInfoIcon = !tappedSummonerRankedInfoIcon;

  @action
  bool setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  bool toggleIsFavorite() => isFavorite = !isFavorite;

  @action
  Future<void> onSearch() async {
    try {
      setIsLoading(true);
      setIsError(false);
      await getSummonerByName();
      await getSummonerRankedInfo('${summonerByName?.id}');
      await getListMatchIdsBySummonerPuuid('${summonerByName?.puuid}');
      await getMatchsById();
      await getSpellsList();
      isMe();
      checkMySpell();
      setIsLoading(false);
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
  Future<void> getSummonerRankedInfo(String summonerId) async {
    try {
      setIsLoading(true);
      setIsError(false);
      entriesInfo = ObservableList<EntryModel?>();
      entriesInfo.addAll(await service.getSummonerRankedInfo(summonerId));
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getListMatchIdsBySummonerPuuid(String puuid) async {
    try {
      setIsLoading(true);
      setIsError(false);
      matchIds = ObservableList();
      matchIds.addAll(await service.getListMatchIdsBySummonerPuuid(puuid));
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getMatchsById() async {
    try {
      setIsLoading(true);
      setIsError(false);
      matchs = ObservableList<MatchModel>();
      for (var matchId in matchIds) {
        match = await service.getMatchById(matchId);
        matchs.add(match);
      }
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSpellsList() async {
    try {
      setIsLoading(true);
      setIsError(false);
      spells = ObservableList<SpellModel>();
      spells.addAll(await service.fetchSpells());
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  void isMe() {
    for (var match in matchs) {
      for (var participant in match!.info!.participants!) {
        if (participant!.summonerName == summonerByName!.name) {
          me.add(participant);
        }
      }
    }
  }

  @action
  void checkMySpell() {
    for (var i in me) {
      for (var spell in spells) {
        if (i.summoner1Id.toString() == spell!.key) {
          summonerSpellId.add(spell.id);
          isMySpell = true;
        }
        if (i.summoner2Id.toString() == spell.key) {
          summonerSpellId2.add(spell.id);
          isMySecondSpell = true;
        }
      }
    }
  }

  double calculateKDA(ParticipantModel summoner) {
    double kda = (summoner.kills! + summoner.assists!) / summoner.deaths!;
    return kda;
  }
}
