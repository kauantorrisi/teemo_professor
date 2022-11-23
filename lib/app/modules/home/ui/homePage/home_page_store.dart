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
  ValueNotifier<String> rankTypeValue = ValueNotifier('');

  @observable
  ValueNotifier<String> rankModeValue = ValueNotifier('');

  @observable
  ValueNotifier<String> rankEloValue = ValueNotifier('');

  @observable
  ValueNotifier<String> rankTierValue = ValueNotifier('');

  @observable
  bool? isLoading;

  @observable
  bool? isLoadingList;

  @observable
  bool? isError;

  @observable
  bool isMySpell = false;

  @observable
  bool isMySecondSpell = false;

  @observable
  bool isFavorite = false;

  @observable
  bool? selectedBestPlayers = true;

  @observable
  bool? selectedLeagues = false;

  @observable
  bool? selectedTFT = false;

  @observable
  bool? selectedSoloQ = true;

  @observable
  bool? selectedFlex = false;

  @observable
  bool? selectedChallenger = true;

  @observable
  bool? selectedGrandMaster = false;

  @observable
  bool? selectedMaster = false;

  @observable
  String? selectedElo = 'Diamond';

  @observable
  String? selectedTier = 'I';

  @observable
  SummonerModel? summonerByName;

  @observable
  MatchModel? match;

  @observable
  RankedModel? rankedModel;

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
  List<SummonerModel?> favoriteSummoners = ObservableList<SummonerModel?>();

  @observable
  ObservableList<EntryModel> favoriteSummonersEntriesModel =
      ObservableList<EntryModel>();

  @action
  bool setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsLoadingList(bool value) => isLoadingList = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  bool toggleIsFavorite() => isFavorite = !isFavorite;

  @action
  bool setSelectedBestPlayers(bool value) => selectedBestPlayers = value;

  @action
  bool setSelectedLeagues(bool value) => selectedLeagues = value;

  @action
  bool setSelectedTFT(bool value) => selectedTFT = value;

  @action
  bool setSelectedSoloQ(bool value) => selectedSoloQ = value;

  @action
  bool setSelectedFlex(bool value) => selectedFlex = value;

  @action
  bool setSelectedChallenger(bool value) => selectedChallenger = value;

  @action
  bool setSelectedGrandMaster(bool value) => selectedGrandMaster = value;

  @action
  bool setSelectedMaster(bool value) => selectedMaster = value;

  @action
  String? setSelectedLeague(String? newValue) => selectedElo = newValue;

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
  Future<void> getRankedChallengerSoloQInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedChallengerSoloQInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedChallengerFlexInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedChallengerFlexInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedGrandmasterSoloQInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedGrandMasterSoloQInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedGrandmasterFlexInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedGrandMasterFlexInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedMasterSoloQInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedMasterSoloQInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedMasterFlexInfo() async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedMasterFlexInfo();
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedDiamondSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedDiamondSoloQInfo(tier: tier);
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedDiamondFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      rankedModel = RankedModel();
      rankedModel = await service.getRankedDiamondFlexInfo(tier: tier);
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  void makeRequestRankedInfoListBasedInUserChoiceInDropDownButton() {
    rankedModel = RankedModel();
    if (selectedBestPlayers == true &&
        selectedLeagues == false &&
        selectedTFT == false) {
      if (selectedBestPlayers == true &&
          selectedSoloQ == true &&
          selectedChallenger == true) {
        getRankedChallengerSoloQInfo();
      }

      if (selectedBestPlayers == true &&
          selectedFlex == true &&
          selectedChallenger == true) {
        getRankedChallengerFlexInfo();
      }

      if (selectedBestPlayers == true &&
          selectedSoloQ == true &&
          selectedGrandMaster == true) {
        getRankedGrandmasterSoloQInfo();
      }

      if (selectedBestPlayers == true &&
          selectedFlex == true &&
          selectedGrandMaster == true) {
        getRankedGrandmasterFlexInfo();
      }

      if (selectedBestPlayers == true &&
          selectedSoloQ == true &&
          selectedMaster == true) {
        getRankedMasterSoloQInfo();
      }

      if (selectedBestPlayers == true &&
          selectedFlex == true &&
          selectedMaster == true) {
        getRankedMasterFlexInfo();
      }
    }

    if (selectedLeagues == true &&
        selectedBestPlayers == false &&
        selectedTFT == false) {
      if (selectedElo == 'Diamond' && selectedSoloQ == true) {
        getRankedDiamondSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Diamond' && selectedFlex == true) {
        getRankedDiamondFlexInfo(tier: selectedTier);
      }
    }
  }

  @action
  List<SummonerModel?> filterFavoriteSummoners() {
    if (summonerByName!.isFavorite!) {
      favoriteSummoners.add(summonerByName);
    }
    return favoriteSummoners;
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
