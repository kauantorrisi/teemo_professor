// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teemo_professor/app/modules/home/service/home_service.dart';

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
  bool selectedBestPlayers = true;

  @observable
  bool selectedSoloQ = true;

  @observable
  bool selectedChallenger = true;

  @observable
  bool selectedGrandMaster = false;

  @observable
  bool selectedMaster = false;

  @observable
  String? selectedElo = 'Diamond';

  @observable
  String? selectedTier = 'I';

  @observable
  bool tappedInSummonerRankedInfoButton = false;

  @observable
  SummonerModel? summonerByName;

  @observable
  MatchModel? match;

  @observable
  RankedModel? rankedModel;

  @observable
  EntryModel? favoriteSummonerEntriesInfo;

  @observable
  ObservableList<EntryModel?> summonersEntriesInfo =
      ObservableList<EntryModel>();

  @observable
  ObservableList<EntryModel?> diamondToIronEntriesInfo =
      ObservableList<EntryModel>();

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
  ObservableList matchIds = ObservableList();

  @observable
  ObservableList<MatchModel?> matchs = ObservableList<MatchModel?>();

  @observable
  ObservableList<ChampionModel?> champions = ObservableList<ChampionModel?>();

  @observable
  ObservableList<SpellModel?> spells = ObservableList<SpellModel?>();

  @observable
  ObservableList<SummonerModel?> favoriteSummoners =
      ObservableList<SummonerModel?>();

  @observable
  ObservableList<EntryModel?> favoriteSummonersEntriesModelList =
      ObservableList<EntryModel?>();

  @action
  bool setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsLoadingList(bool value) => isLoadingList = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  bool setSelectedBestPlayers(bool value) => selectedBestPlayers = value;

  @action
  bool setSelectedSoloQ(bool value) => selectedSoloQ = value;

  @action
  bool setSelectedChallenger(bool value) => selectedChallenger = value;

  @action
  bool setSelectedGrandMaster(bool value) => selectedGrandMaster = value;

  @action
  bool setSelectedMaster(bool value) => selectedMaster = value;

  @action
  String? setSelectedLeague(String? value) => selectedElo = value;

  @action
  bool toggleTappedInSummonerRankedInfoButton() =>
      tappedInSummonerRankedInfoButton = !tappedInSummonerRankedInfoButton;

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
      summonersEntriesInfo = ObservableList<EntryModel?>();
      favoriteSummonersEntriesModelList = ObservableList<EntryModel?>();
      summonersEntriesInfo
          .addAll(await service.getSummonerRankedInfo(summonerId));
      favoriteSummonersEntriesModelList
          .addAll(await service.getSummonerRankedInfo(summonerId));
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
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedDiamondSoloQInfo(tier: tier));
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
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedDiamondFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedPlatinumSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedPlatinumSoloQInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedPlatinumFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedPlatinumFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedGoldSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedGoldSoloQInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedGoldFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedGoldFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedSilverSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedSilverSoloQInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedSilverFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedSilverFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedBronzeSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedBronzeSoloQInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedBronzeFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedBronzeFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedIronSoloQInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedIronSoloQInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getRankedIronFlexInfo({required String? tier}) async {
    try {
      setIsLoadingList(true);
      setIsError(false);
      diamondToIronEntriesInfo = ObservableList<EntryModel>();
      diamondToIronEntriesInfo
          .addAll(await service.getRankedIronFlexInfo(tier: tier));
      setIsLoadingList(false);
    } catch (e) {
      setIsLoadingList(false);
      setIsError(true);
    }
  }

  @action
  Future<void> makeRequestRankedInfoListBasedInUserChoice() async {
    if (selectedBestPlayers == true) {
      if (selectedSoloQ == true && selectedChallenger == true) {
        getRankedChallengerSoloQInfo();
      }

      if (selectedSoloQ == false && selectedChallenger == true) {
        getRankedChallengerFlexInfo();
      }

      if (selectedSoloQ == true && selectedGrandMaster == true) {
        getRankedGrandmasterSoloQInfo();
      }

      if (selectedSoloQ == false && selectedGrandMaster == true) {
        getRankedGrandmasterFlexInfo();
      }

      if (selectedSoloQ == true && selectedMaster == true) {
        getRankedMasterSoloQInfo();
      }

      if (selectedSoloQ == false && selectedMaster == true) {
        getRankedMasterFlexInfo();
      }
    }

    if (selectedBestPlayers == false) {
      if (selectedElo == 'Diamond' && selectedSoloQ == true) {
        getRankedDiamondSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Diamond' && selectedSoloQ == false) {
        getRankedDiamondFlexInfo(tier: selectedTier);
      }

      if (selectedElo == 'Platinum' && selectedSoloQ == true) {
        getRankedPlatinumSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Platinum' && selectedSoloQ == false) {
        getRankedPlatinumFlexInfo(tier: selectedTier);
      }

      if (selectedElo == 'Gold' && selectedSoloQ == true) {
        getRankedGoldSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Gold' && selectedSoloQ == false) {
        getRankedGoldFlexInfo(tier: selectedTier);
      }

      if (selectedElo == 'Silver' && selectedSoloQ == true) {
        getRankedSilverSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Silver' && selectedSoloQ == false) {
        getRankedSilverFlexInfo(tier: selectedTier);
      }

      if (selectedElo == 'Bronze' && selectedSoloQ == true) {
        getRankedBronzeSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Bronze' && selectedSoloQ == false) {
        getRankedBronzeFlexInfo(tier: selectedTier);
      }

      if (selectedElo == 'Iron' && selectedSoloQ == true) {
        getRankedIronSoloQInfo(tier: selectedTier);
      }

      if (selectedElo == 'Iron' && selectedSoloQ == false) {
        getRankedIronFlexInfo(tier: selectedTier);
      }
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
