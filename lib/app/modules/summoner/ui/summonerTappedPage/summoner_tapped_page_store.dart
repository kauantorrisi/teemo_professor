import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teemo_professor/app/modules/summoner/service/summoner_service.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/match.model.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/models/spell.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';
part 'summoner_page_store.g.dart';

class SummonerTappedPageStore = _SummonerTappedPageStoreBase
    with _$SummonerTappedPageStore;

abstract class _SummonerTappedPageStoreBase with Store {
  final SummonerService service = Modular.get();

  @observable
  bool? isLoading;

  @observable
  bool? isError;

  @observable
  SummonerModel? summonerTappedInfoModel;

  @observable
  ObservableList<EntryModel?> entriesInfo = ObservableList();

  @observable
  MatchModel? match;

  @observable
  ObservableList<ParticipantModel> summonerTappedList =
      ObservableList<ParticipantModel>();

  @observable
  ObservableList<String?> summonerTappedSpellId = ObservableList<String?>();

  @observable
  ObservableList<String?> summonerTappedSpellId2 = ObservableList<String?>();

  @observable
  bool tappedSummonerRankedInfoIcon = false;

  @observable
  bool isSummonerTappedSpell = false;

  @observable
  bool isSummonerTappedSSecondSpell = false;

  @observable
  ObservableList<dynamic> matchIds = ObservableList();

  @observable
  ObservableList<MatchModel?> matchs = ObservableList<MatchModel?>();

  @observable
  ObservableList<ChampionModel?> champions = ObservableList<ChampionModel?>();

  @observable
  ObservableList<SpellModel?> spells = ObservableList<SpellModel?>();

  @action
  bool toggleArrowButton() =>
      tappedSummonerRankedInfoIcon = !tappedSummonerRankedInfoIcon;

  @action
  bool setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  Future<void> searchSummonerTapped(String summonerName) async {
    try {
      setIsLoading(true);
      setIsError(false);
      await getSummonerTappedInfoByName(summonerName);
      await getSummonerRankedInfo('${summonerTappedInfoModel?.id}');
      await getListMatchIdsBySummonerPuuid('${summonerTappedInfoModel?.puuid}');
      await getMatchsById();
      await getSpellsList();
      isSummonerTappedInfo();
      checkSpellSummonerTapped();
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getSummonerTappedInfoByName(String summonerName) async {
    try {
      setIsLoading(true);
      setIsError(false);
      summonerTappedInfoModel = SummonerModel();
      summonerTappedInfoModel = await service.getSummonerByName(summonerName);
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
  void isSummonerTappedInfo() {
    for (var match in matchs) {
      for (var participant in match!.info!.participants!) {
        if (participant!.summonerName == summonerTappedInfoModel!.name) {
          summonerTappedList.add(participant);
        }
      }
    }
  }

  @action
  void checkSpellSummonerTapped() {
    for (var i in summonerTappedList) {
      for (var spell in spells) {
        if (i.summoner1Id.toString() == spell!.key) {
          summonerTappedSpellId.add(spell.id);
          isSummonerTappedSpell = true;
        }
        if (i.summoner2Id.toString() == spell.key) {
          summonerTappedSpellId2.add(spell.id);
          isSummonerTappedSSecondSpell = true;
        }
      }
    }
  }
}
