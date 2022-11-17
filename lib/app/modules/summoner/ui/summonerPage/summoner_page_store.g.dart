// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SummonerPageStore on _SummonerPageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SummonerPageStoreBase.isLoading', context: context);

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
      Atom(name: '_SummonerPageStoreBase.isError', context: context);

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

  late final _$summonerByNameAtom =
      Atom(name: '_SummonerPageStoreBase.summonerByName', context: context);

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

  late final _$entriesInfoAtom =
      Atom(name: '_SummonerPageStoreBase.entriesInfo', context: context);

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

  late final _$matchAtom =
      Atom(name: '_SummonerPageStoreBase.match', context: context);

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

  late final _$meAtom =
      Atom(name: '_SummonerPageStoreBase.me', context: context);

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
      Atom(name: '_SummonerPageStoreBase.summonerSpellId', context: context);

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
      Atom(name: '_SummonerPageStoreBase.summonerSpellId2', context: context);

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

  late final _$isMySpellAtom =
      Atom(name: '_SummonerPageStoreBase.isMySpell', context: context);

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
      Atom(name: '_SummonerPageStoreBase.isMySecondSpell', context: context);

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

  late final _$championsMasteryAtom =
      Atom(name: '_SummonerPageStoreBase.championsMastery', context: context);

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
      Atom(name: '_SummonerPageStoreBase.matchIds', context: context);

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
      Atom(name: '_SummonerPageStoreBase.matchs', context: context);

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
      Atom(name: '_SummonerPageStoreBase.champions', context: context);

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
      Atom(name: '_SummonerPageStoreBase.spells', context: context);

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

  late final _$onSearchAsyncAction =
      AsyncAction('_SummonerPageStoreBase.onSearch', context: context);

  @override
  Future<void> onSearch() {
    return _$onSearchAsyncAction.run(() => super.onSearch());
  }

  late final _$getSummonerByNameAsyncAction =
      AsyncAction('_SummonerPageStoreBase.getSummonerByName', context: context);

  @override
  Future<void> getSummonerByName() {
    return _$getSummonerByNameAsyncAction.run(() => super.getSummonerByName());
  }

  late final _$getSummonerRankedInfoAsyncAction = AsyncAction(
      '_SummonerPageStoreBase.getSummonerRankedInfo',
      context: context);

  @override
  Future<void> getSummonerRankedInfo(String summonerId) {
    return _$getSummonerRankedInfoAsyncAction
        .run(() => super.getSummonerRankedInfo(summonerId));
  }

  late final _$getListMatchIdsBySummonerPuuidAsyncAction = AsyncAction(
      '_SummonerPageStoreBase.getListMatchIdsBySummonerPuuid',
      context: context);

  @override
  Future<void> getListMatchIdsBySummonerPuuid(String puuid) {
    return _$getListMatchIdsBySummonerPuuidAsyncAction
        .run(() => super.getListMatchIdsBySummonerPuuid(puuid));
  }

  late final _$getMatchsByIdAsyncAction =
      AsyncAction('_SummonerPageStoreBase.getMatchsById', context: context);

  @override
  Future<void> getMatchsById() {
    return _$getMatchsByIdAsyncAction.run(() => super.getMatchsById());
  }

  late final _$getSpellsListAsyncAction =
      AsyncAction('_SummonerPageStoreBase.getSpellsList', context: context);

  @override
  Future<void> getSpellsList() {
    return _$getSpellsListAsyncAction.run(() => super.getSpellsList());
  }

  late final _$_SummonerPageStoreBaseActionController =
      ActionController(name: '_SummonerPageStoreBase', context: context);

  @override
  bool setIsLoading(bool value) {
    final _$actionInfo = _$_SummonerPageStoreBaseActionController.startAction(
        name: '_SummonerPageStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SummonerPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsError(bool value) {
    final _$actionInfo = _$_SummonerPageStoreBaseActionController.startAction(
        name: '_SummonerPageStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_SummonerPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isMe() {
    final _$actionInfo = _$_SummonerPageStoreBaseActionController.startAction(
        name: '_SummonerPageStoreBase.isMe');
    try {
      return super.isMe();
    } finally {
      _$_SummonerPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkMySpell() {
    final _$actionInfo = _$_SummonerPageStoreBaseActionController.startAction(
        name: '_SummonerPageStoreBase.checkMySpell');
    try {
      return super.checkMySpell();
    } finally {
      _$_SummonerPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
summonerByName: ${summonerByName},
entriesInfo: ${entriesInfo},
match: ${match},
me: ${me},
summonerSpellId: ${summonerSpellId},
summonerSpellId2: ${summonerSpellId2},
isMySpell: ${isMySpell},
isMySecondSpell: ${isMySecondSpell},
championsMastery: ${championsMastery},
matchIds: ${matchIds},
matchs: ${matchs},
champions: ${champions},
spells: ${spells}
    ''';
  }
}
