// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomePageStoreBase.isLoading', context: context);

  @override
  bool? get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool? value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_HomePageStoreBase.isError', context: context);

  @override
  bool? get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool? value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$isMySpellAtom =
      Atom(name: '_HomePageStoreBase.isMySpell', context: context);

  @override
  bool get isMySpell {
    _$isMySpellAtom.reportRead();
    return super.isMySpell;
  }

  @override
  set isMySpell(bool value) {
    _$isMySpellAtom.reportWrite(value, super.isMySpell, () {
      super.isMySpell = value;
    });
  }

  late final _$isMySecondSpellAtom =
      Atom(name: '_HomePageStoreBase.isMySecondSpell', context: context);

  @override
  bool get isMySecondSpell {
    _$isMySecondSpellAtom.reportRead();
    return super.isMySecondSpell;
  }

  @override
  set isMySecondSpell(bool value) {
    _$isMySecondSpellAtom.reportWrite(value, super.isMySecondSpell, () {
      super.isMySecondSpell = value;
    });
  }

  late final _$selectedBestPlayersAtom =
      Atom(name: '_HomePageStoreBase.selectedBestPlayers', context: context);

  @override
  bool get selectedBestPlayers {
    _$selectedBestPlayersAtom.reportRead();
    return super.selectedBestPlayers;
  }

  @override
  set selectedBestPlayers(bool value) {
    _$selectedBestPlayersAtom.reportWrite(value, super.selectedBestPlayers, () {
      super.selectedBestPlayers = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_HomePageStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$summonerByNameAtom =
      Atom(name: '_HomePageStoreBase.summonerByName', context: context);

  @override
  SummonerModel? get summonerByName {
    _$summonerByNameAtom.reportRead();
    return super.summonerByName;
  }

  @override
  set summonerByName(SummonerModel? value) {
    _$summonerByNameAtom.reportWrite(value, super.summonerByName, () {
      super.summonerByName = value;
    });
  }

  late final _$matchAtom =
      Atom(name: '_HomePageStoreBase.match', context: context);

  @override
  MatchModel? get match {
    _$matchAtom.reportRead();
    return super.match;
  }

  @override
  set match(MatchModel? value) {
    _$matchAtom.reportWrite(value, super.match, () {
      super.match = value;
    });
  }

  late final _$rankedChallengerSoloQInfoAtom = Atom(
      name: '_HomePageStoreBase.rankedChallengerSoloQInfo', context: context);

  @override
  RankedModel? get rankedChallengerSoloQInfo {
    _$rankedChallengerSoloQInfoAtom.reportRead();
    return super.rankedChallengerSoloQInfo;
  }

  @override
  set rankedChallengerSoloQInfo(RankedModel? value) {
    _$rankedChallengerSoloQInfoAtom
        .reportWrite(value, super.rankedChallengerSoloQInfo, () {
      super.rankedChallengerSoloQInfo = value;
    });
  }

  late final _$entriesInfoAtom =
      Atom(name: '_HomePageStoreBase.entriesInfo', context: context);

  @override
  ObservableList<EntryModel?> get entriesInfo {
    _$entriesInfoAtom.reportRead();
    return super.entriesInfo;
  }

  @override
  set entriesInfo(ObservableList<EntryModel?> value) {
    _$entriesInfoAtom.reportWrite(value, super.entriesInfo, () {
      super.entriesInfo = value;
    });
  }

  late final _$meAtom = Atom(name: '_HomePageStoreBase.me', context: context);

  @override
  ObservableList<ParticipantModel> get me {
    _$meAtom.reportRead();
    return super.me;
  }

  @override
  set me(ObservableList<ParticipantModel> value) {
    _$meAtom.reportWrite(value, super.me, () {
      super.me = value;
    });
  }

  late final _$summonerSpellIdAtom =
      Atom(name: '_HomePageStoreBase.summonerSpellId', context: context);

  @override
  ObservableList<String?> get summonerSpellId {
    _$summonerSpellIdAtom.reportRead();
    return super.summonerSpellId;
  }

  @override
  set summonerSpellId(ObservableList<String?> value) {
    _$summonerSpellIdAtom.reportWrite(value, super.summonerSpellId, () {
      super.summonerSpellId = value;
    });
  }

  late final _$summonerSpellId2Atom =
      Atom(name: '_HomePageStoreBase.summonerSpellId2', context: context);

  @override
  ObservableList<String?> get summonerSpellId2 {
    _$summonerSpellId2Atom.reportRead();
    return super.summonerSpellId2;
  }

  @override
  set summonerSpellId2(ObservableList<String?> value) {
    _$summonerSpellId2Atom.reportWrite(value, super.summonerSpellId2, () {
      super.summonerSpellId2 = value;
    });
  }

  late final _$championsMasteryAtom =
      Atom(name: '_HomePageStoreBase.championsMastery', context: context);

  @override
  ObservableList<ChampionsMasteryModel> get championsMastery {
    _$championsMasteryAtom.reportRead();
    return super.championsMastery;
  }

  @override
  set championsMastery(ObservableList<ChampionsMasteryModel> value) {
    _$championsMasteryAtom.reportWrite(value, super.championsMastery, () {
      super.championsMastery = value;
    });
  }

  late final _$matchIdsAtom =
      Atom(name: '_HomePageStoreBase.matchIds', context: context);

  @override
  ObservableList<dynamic> get matchIds {
    _$matchIdsAtom.reportRead();
    return super.matchIds;
  }

  @override
  set matchIds(ObservableList<dynamic> value) {
    _$matchIdsAtom.reportWrite(value, super.matchIds, () {
      super.matchIds = value;
    });
  }

  late final _$matchsAtom =
      Atom(name: '_HomePageStoreBase.matchs', context: context);

  @override
  ObservableList<MatchModel?> get matchs {
    _$matchsAtom.reportRead();
    return super.matchs;
  }

  @override
  set matchs(ObservableList<MatchModel?> value) {
    _$matchsAtom.reportWrite(value, super.matchs, () {
      super.matchs = value;
    });
  }

  late final _$championsAtom =
      Atom(name: '_HomePageStoreBase.champions', context: context);

  @override
  ObservableList<ChampionModel?> get champions {
    _$championsAtom.reportRead();
    return super.champions;
  }

  @override
  set champions(ObservableList<ChampionModel?> value) {
    _$championsAtom.reportWrite(value, super.champions, () {
      super.champions = value;
    });
  }

  late final _$spellsAtom =
      Atom(name: '_HomePageStoreBase.spells', context: context);

  @override
  ObservableList<SpellModel?> get spells {
    _$spellsAtom.reportRead();
    return super.spells;
  }

  @override
  set spells(ObservableList<SpellModel?> value) {
    _$spellsAtom.reportWrite(value, super.spells, () {
      super.spells = value;
    });
  }

  late final _$favoriteSummonersAtom =
      Atom(name: '_HomePageStoreBase.favoriteSummoners', context: context);

  @override
  List<SummonerModel?> get favoriteSummoners {
    _$favoriteSummonersAtom.reportRead();
    return super.favoriteSummoners;
  }

  @override
  set favoriteSummoners(List<SummonerModel?> value) {
    _$favoriteSummonersAtom.reportWrite(value, super.favoriteSummoners, () {
      super.favoriteSummoners = value;
    });
  }

  late final _$favoriteSummonersEntriesModelAtom = Atom(
      name: '_HomePageStoreBase.favoriteSummonersEntriesModel',
      context: context);

  @override
  ObservableList<EntryModel> get favoriteSummonersEntriesModel {
    _$favoriteSummonersEntriesModelAtom.reportRead();
    return super.favoriteSummonersEntriesModel;
  }

  @override
  set favoriteSummonersEntriesModel(ObservableList<EntryModel> value) {
    _$favoriteSummonersEntriesModelAtom
        .reportWrite(value, super.favoriteSummonersEntriesModel, () {
      super.favoriteSummonersEntriesModel = value;
    });
  }

  late final _$onSearchAsyncAction =
      AsyncAction('_HomePageStoreBase.onSearch', context: context);

  @override
  Future<void> onSearch() {
    return _$onSearchAsyncAction.run(() => super.onSearch());
  }

  late final _$getSummonerByNameAsyncAction =
      AsyncAction('_HomePageStoreBase.getSummonerByName', context: context);

  @override
  Future<void> getSummonerByName() {
    return _$getSummonerByNameAsyncAction.run(() => super.getSummonerByName());
  }

  late final _$getSummonerRankedInfoAsyncAction =
      AsyncAction('_HomePageStoreBase.getSummonerRankedInfo', context: context);

  @override
  Future<void> getSummonerRankedInfo(String summonerId) {
    return _$getSummonerRankedInfoAsyncAction
        .run(() => super.getSummonerRankedInfo(summonerId));
  }

  late final _$getListMatchIdsBySummonerPuuidAsyncAction = AsyncAction(
      '_HomePageStoreBase.getListMatchIdsBySummonerPuuid',
      context: context);

  @override
  Future<void> getListMatchIdsBySummonerPuuid(String puuid) {
    return _$getListMatchIdsBySummonerPuuidAsyncAction
        .run(() => super.getListMatchIdsBySummonerPuuid(puuid));
  }

  late final _$getMatchsByIdAsyncAction =
      AsyncAction('_HomePageStoreBase.getMatchsById', context: context);

  @override
  Future<void> getMatchsById() {
    return _$getMatchsByIdAsyncAction.run(() => super.getMatchsById());
  }

  late final _$getSpellsListAsyncAction =
      AsyncAction('_HomePageStoreBase.getSpellsList', context: context);

  @override
  Future<void> getSpellsList() {
    return _$getSpellsListAsyncAction.run(() => super.getSpellsList());
  }

  late final _$getRankedChallengerSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedChallengerSoloQInfo',
      context: context);

  @override
  Future<void> getRankedChallengerSoloQInfo() {
    return _$getRankedChallengerSoloQInfoAsyncAction
        .run(() => super.getRankedChallengerSoloQInfo());
  }

  late final _$_HomePageStoreBaseActionController =
      ActionController(name: '_HomePageStoreBase', context: context);

  @override
  bool setIsLoading(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsError(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool toggleIsFavorite() {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.toggleIsFavorite');
    try {
      return super.toggleIsFavorite();
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setSelectedBestPlayers(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedBestPlayers');
    try {
      return super.setSelectedBestPlayers(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<SummonerModel?> filterFavoriteSummoners() {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.filterFavoriteSummoners');
    try {
      return super.filterFavoriteSummoners();
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
isMySpell: ${isMySpell},
isMySecondSpell: ${isMySecondSpell},
selectedBestPlayers: ${selectedBestPlayers},
isFavorite: ${isFavorite},
summonerByName: ${summonerByName},
match: ${match},
rankedChallengerSoloQInfo: ${rankedChallengerSoloQInfo},
entriesInfo: ${entriesInfo},
me: ${me},
summonerSpellId: ${summonerSpellId},
summonerSpellId2: ${summonerSpellId2},
championsMastery: ${championsMastery},
matchIds: ${matchIds},
matchs: ${matchs},
champions: ${champions},
spells: ${spells},
favoriteSummoners: ${favoriteSummoners},
favoriteSummonersEntriesModel: ${favoriteSummonersEntriesModel}
    ''';
  }
}
