// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_tapped_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SummonerTappedPageStore on _SummonerTappedPageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SummonerTappedPageStoreBase.isLoading', context: context);

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
      Atom(name: '_SummonerTappedPageStoreBase.isError', context: context);

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

  late final _$summonerInfoModelAtom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerInfoModel', context: context);

  @override
  SummonerModel? get summonerInfoModel {
    _$summonerInfoModelAtom.reportRead();
    return super.summonerInfoModel;
  }

  @override
  set summonerInfoModel(SummonerModel? value) {
    _$summonerInfoModelAtom.reportWrite(value, super.summonerInfoModel, () {
      super.summonerInfoModel = value;
    });
  }

  late final _$entriesInfoAtom =
      Atom(name: '_SummonerTappedPageStoreBase.entriesInfo', context: context);

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
      Atom(name: '_SummonerTappedPageStoreBase.match', context: context);

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

  late final _$summonerListAtom =
      Atom(name: '_SummonerTappedPageStoreBase.summonerList', context: context);

  @override
  ObservableList<ParticipantModel> get summonerList {
    _$summonerListAtom.reportRead();
    return super.summonerList;
  }

  @override
  set summonerList(ObservableList<ParticipantModel> value) {
    _$summonerListAtom.reportWrite(value, super.summonerList, () {
      super.summonerList = value;
    });
  }

  late final _$summonerSpellIdAtom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerSpellId', context: context);

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

  late final _$summonerSpellId2Atom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerSpellId2', context: context);

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

  late final _$isSummonerSpellAtom = Atom(
      name: '_SummonerTappedPageStoreBase.isSummonerSpell', context: context);

  @override
  bool get isSummonerSpell {
    _$isSummonerSpellAtom.reportRead();
    return super.isSummonerSpell;
  }

  @override
  set isSummonerSpell(bool value) {
    _$isSummonerSpellAtom.reportWrite(value, super.isSummonerSpell, () {
      super.isSummonerSpell = value;
    });
  }

  late final _$isSummonerSecondSpellAtom = Atom(
      name: '_SummonerTappedPageStoreBase.isSummonerSecondSpell',
      context: context);

  @override
  bool get isSummonerSecondSpell {
    _$isSummonerSecondSpellAtom.reportRead();
    return super.isSummonerSecondSpell;
  }

  @override
  set isSummonerSecondSpell(bool value) {
    _$isSummonerSecondSpellAtom.reportWrite(value, super.isSummonerSecondSpell,
        () {
      super.isSummonerSecondSpell = value;
    });
  }

  late final _$matchIdsAtom =
      Atom(name: '_SummonerTappedPageStoreBase.matchIds', context: context);

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
      Atom(name: '_SummonerTappedPageStoreBase.matchs', context: context);

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
      Atom(name: '_SummonerTappedPageStoreBase.champions', context: context);

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
      Atom(name: '_SummonerTappedPageStoreBase.spells', context: context);

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

  late final _$searchSummonerTappedAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.searchSummonerTapped',
      context: context);

  @override
  Future<void> searchSummonerTapped(String summonerName) {
    return _$searchSummonerTappedAsyncAction
        .run(() => super.searchSummonerTapped(summonerName));
  }

  late final _$getSummonerTappedInfoByNameAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.getSummonerTappedInfoByName',
      context: context);

  @override
  Future<void> getSummonerTappedInfoByName(String summonerName) {
    return _$getSummonerTappedInfoByNameAsyncAction
        .run(() => super.getSummonerTappedInfoByName(summonerName));
  }

  late final _$getSummonerRankedInfoAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.getSummonerRankedInfo',
      context: context);

  @override
  Future<void> getSummonerRankedInfo(String summonerId) {
    return _$getSummonerRankedInfoAsyncAction
        .run(() => super.getSummonerRankedInfo(summonerId));
  }

  late final _$getListMatchIdsBySummonerPuuidAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.getListMatchIdsBySummonerPuuid',
      context: context);

  @override
  Future<void> getListMatchIdsBySummonerPuuid(String puuid) {
    return _$getListMatchIdsBySummonerPuuidAsyncAction
        .run(() => super.getListMatchIdsBySummonerPuuid(puuid));
  }

  late final _$getMatchsByIdAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.getMatchsById',
      context: context);

  @override
  Future<void> getMatchsById() {
    return _$getMatchsByIdAsyncAction.run(() => super.getMatchsById());
  }

  late final _$getSpellsListAsyncAction = AsyncAction(
      '_SummonerTappedPageStoreBase.getSpellsList',
      context: context);

  @override
  Future<void> getSpellsList() {
    return _$getSpellsListAsyncAction.run(() => super.getSpellsList());
  }

  late final _$_SummonerTappedPageStoreBaseActionController =
      ActionController(name: '_SummonerTappedPageStoreBase', context: context);

  @override
  bool setIsLoading(bool value) {
    final _$actionInfo = _$_SummonerTappedPageStoreBaseActionController
        .startAction(name: '_SummonerTappedPageStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SummonerTappedPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsError(bool value) {
    final _$actionInfo = _$_SummonerTappedPageStoreBaseActionController
        .startAction(name: '_SummonerTappedPageStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_SummonerTappedPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSummonerTappedInfo() {
    final _$actionInfo = _$_SummonerTappedPageStoreBaseActionController
        .startAction(name: '_SummonerTappedPageStoreBase.isSummonerTappedInfo');
    try {
      return super.isSummonerTappedInfo();
    } finally {
      _$_SummonerTappedPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkSpellSummonerTapped() {
    final _$actionInfo =
        _$_SummonerTappedPageStoreBaseActionController.startAction(
            name: '_SummonerTappedPageStoreBase.checkSpellSummonerTapped');
    try {
      return super.checkSpellSummonerTapped();
    } finally {
      _$_SummonerTappedPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
summonerInfoModel: ${summonerInfoModel},
entriesInfo: ${entriesInfo},
match: ${match},
summonerList: ${summonerList},
summonerSpellId: ${summonerSpellId},
summonerSpellId2: ${summonerSpellId2},
isSummonerSpell: ${isSummonerSpell},
isSummonerSecondSpell: ${isSummonerSecondSpell},
matchIds: ${matchIds},
matchs: ${matchs},
champions: ${champions},
spells: ${spells}
    ''';
  }
}
