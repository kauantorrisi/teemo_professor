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

  late final _$summonerTappedInfoModelAtom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerTappedInfoModel',
      context: context);

  @override
  SummonerModel? get summonerTappedInfoModel {
    _$summonerTappedInfoModelAtom.reportRead();
    return super.summonerTappedInfoModel;
  }

  @override
  set summonerTappedInfoModel(SummonerModel? value) {
    _$summonerTappedInfoModelAtom
        .reportWrite(value, super.summonerTappedInfoModel, () {
      super.summonerTappedInfoModel = value;
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

  late final _$summonerTappedListAtom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerTappedList',
      context: context);

  @override
  ObservableList<ParticipantModel> get summonerTappedList {
    _$summonerTappedListAtom.reportRead();
    return super.summonerTappedList;
  }

  @override
  set summonerTappedList(ObservableList<ParticipantModel> value) {
    _$summonerTappedListAtom.reportWrite(value, super.summonerTappedList, () {
      super.summonerTappedList = value;
    });
  }

  late final _$summonerTappedSpellIdAtom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerTappedSpellId',
      context: context);

  @override
  ObservableList<String?> get summonerTappedSpellId {
    _$summonerTappedSpellIdAtom.reportRead();
    return super.summonerTappedSpellId;
  }

  @override
  set summonerTappedSpellId(ObservableList<String?> value) {
    _$summonerTappedSpellIdAtom.reportWrite(value, super.summonerTappedSpellId,
        () {
      super.summonerTappedSpellId = value;
    });
  }

  late final _$summonerTappedSpellId2Atom = Atom(
      name: '_SummonerTappedPageStoreBase.summonerTappedSpellId2',
      context: context);

  @override
  ObservableList<String?> get summonerTappedSpellId2 {
    _$summonerTappedSpellId2Atom.reportRead();
    return super.summonerTappedSpellId2;
  }

  @override
  set summonerTappedSpellId2(ObservableList<String?> value) {
    _$summonerTappedSpellId2Atom
        .reportWrite(value, super.summonerTappedSpellId2, () {
      super.summonerTappedSpellId2 = value;
    });
  }

  late final _$tappedSummonerRankedInfoIconAtom = Atom(
      name: '_SummonerTappedPageStoreBase.tappedSummonerRankedInfoIcon',
      context: context);

  @override
  bool get tappedSummonerRankedInfoIcon {
    _$tappedSummonerRankedInfoIconAtom.reportRead();
    return super.tappedSummonerRankedInfoIcon;
  }

  @override
  set tappedSummonerRankedInfoIcon(bool value) {
    _$tappedSummonerRankedInfoIconAtom
        .reportWrite(value, super.tappedSummonerRankedInfoIcon, () {
      super.tappedSummonerRankedInfoIcon = value;
    });
  }

  late final _$isSummonerTappedSpellAtom = Atom(
      name: '_SummonerTappedPageStoreBase.isSummonerTappedSpell',
      context: context);

  @override
  bool get isSummonerTappedSpell {
    _$isSummonerTappedSpellAtom.reportRead();
    return super.isSummonerTappedSpell;
  }

  @override
  set isSummonerTappedSpell(bool value) {
    _$isSummonerTappedSpellAtom.reportWrite(value, super.isSummonerTappedSpell,
        () {
      super.isSummonerTappedSpell = value;
    });
  }

  late final _$isSummonerTappedSSecondSpellAtom = Atom(
      name: '_SummonerTappedPageStoreBase.isSummonerTappedSSecondSpell',
      context: context);

  @override
  bool get isSummonerTappedSSecondSpell {
    _$isSummonerTappedSSecondSpellAtom.reportRead();
    return super.isSummonerTappedSSecondSpell;
  }

  @override
  set isSummonerTappedSSecondSpell(bool value) {
    _$isSummonerTappedSSecondSpellAtom
        .reportWrite(value, super.isSummonerTappedSSecondSpell, () {
      super.isSummonerTappedSSecondSpell = value;
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
  bool toggleArrowButton() {
    final _$actionInfo = _$_SummonerTappedPageStoreBaseActionController
        .startAction(name: '_SummonerTappedPageStoreBase.toggleArrowButton');
    try {
      return super.toggleArrowButton();
    } finally {
      _$_SummonerTappedPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
summonerTappedInfoModel: ${summonerTappedInfoModel},
entriesInfo: ${entriesInfo},
match: ${match},
summonerTappedList: ${summonerTappedList},
summonerTappedSpellId: ${summonerTappedSpellId},
summonerTappedSpellId2: ${summonerTappedSpellId2},
tappedSummonerRankedInfoIcon: ${tappedSummonerRankedInfoIcon},
isSummonerTappedSpell: ${isSummonerTappedSpell},
isSummonerTappedSSecondSpell: ${isSummonerTappedSSecondSpell},
matchIds: ${matchIds},
matchs: ${matchs},
champions: ${champions},
spells: ${spells}
    ''';
  }
}
