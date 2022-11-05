// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SummonerStore on _SummonerStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SummonerStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_SummonerStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$summonerByNameAtom =
      Atom(name: '_SummonerStoreBase.summonerByName', context: context);

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

  late final _$summonerByPuuidAtom =
      Atom(name: '_SummonerStoreBase.summonerByPuuid', context: context);

  @override
  SummonerModel? get summonerByPuuid {
    _$summonerByPuuidAtom.reportRead();
    return super.summonerByPuuid;
  }

  @override
  set summonerByPuuid(SummonerModel? value) {
    _$summonerByPuuidAtom.reportWrite(value, super.summonerByPuuid, () {
      super.summonerByPuuid = value;
    });
  }

  late final _$entriesInfoAtom =
      Atom(name: '_SummonerStoreBase.entriesInfo', context: context);

  @override
  EntryModel? get entriesInfo {
    _$entriesInfoAtom.reportRead();
    return super.entriesInfo;
  }

  @override
  set entriesInfo(EntryModel? value) {
    _$entriesInfoAtom.reportWrite(value, super.entriesInfo, () {
      super.entriesInfo = value;
    });
  }

  late final _$rankedChallengerSoloQInfoAtom = Atom(
      name: '_SummonerStoreBase.rankedChallengerSoloQInfo', context: context);

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

  late final _$matchAtom =
      Atom(name: '_SummonerStoreBase.match', context: context);

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

  late final _$totalMasteryPointsAtom =
      Atom(name: '_SummonerStoreBase.totalMasteryPoints', context: context);

  @override
  int? get totalMasteryPoints {
    _$totalMasteryPointsAtom.reportRead();
    return super.totalMasteryPoints;
  }

  @override
  set totalMasteryPoints(int? value) {
    _$totalMasteryPointsAtom.reportWrite(value, super.totalMasteryPoints, () {
      super.totalMasteryPoints = value;
    });
  }

  late final _$championsMasteryAtom =
      Atom(name: '_SummonerStoreBase.championsMastery', context: context);

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
      Atom(name: '_SummonerStoreBase.matchIds', context: context);

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

  late final _$initStateAsyncAction =
      AsyncAction('_SummonerStoreBase.initState', context: context);

  @override
  Future<void> initState() {
    return _$initStateAsyncAction.run(() => super.initState());
  }

  late final _$onSearchAsyncAction =
      AsyncAction('_SummonerStoreBase.onSearch', context: context);

  @override
  Future<void> onSearch() {
    return _$onSearchAsyncAction.run(() => super.onSearch());
  }

  late final _$getSummonerByNameAsyncAction =
      AsyncAction('_SummonerStoreBase.getSummonerByName', context: context);

  @override
  Future<void> getSummonerByName() {
    return _$getSummonerByNameAsyncAction.run(() => super.getSummonerByName());
  }

  late final _$getSummonerByPUUIDAsyncAction =
      AsyncAction('_SummonerStoreBase.getSummonerByPUUID', context: context);

  @override
  Future<void> getSummonerByPUUID(String puuid) {
    return _$getSummonerByPUUIDAsyncAction
        .run(() => super.getSummonerByPUUID(puuid));
  }

  late final _$getSummonerSummonerRankedInfoAsyncAction = AsyncAction(
      '_SummonerStoreBase.getSummonerSummonerRankedInfo',
      context: context);

  @override
  Future<void> getSummonerSummonerRankedInfo(String summonerId) {
    return _$getSummonerSummonerRankedInfoAsyncAction
        .run(() => super.getSummonerSummonerRankedInfo(summonerId));
  }

  late final _$getTopChampionsMasteryAsyncAction = AsyncAction(
      '_SummonerStoreBase.getTopChampionsMastery',
      context: context);

  @override
  Future<void> getTopChampionsMastery(String summonerId) {
    return _$getTopChampionsMasteryAsyncAction
        .run(() => super.getTopChampionsMastery(summonerId));
  }

  late final _$getSummonerTotalMasteryPointsAsyncAction = AsyncAction(
      '_SummonerStoreBase.getSummonerTotalMasteryPoints',
      context: context);

  @override
  Future<void> getSummonerTotalMasteryPoints(String summonerId) {
    return _$getSummonerTotalMasteryPointsAsyncAction
        .run(() => super.getSummonerTotalMasteryPoints(summonerId));
  }

  late final _$getListMatchIdsAsyncAction =
      AsyncAction('_SummonerStoreBase.getListMatchIds', context: context);

  @override
  Future<void> getListMatchIds(String puuid) {
    return _$getListMatchIdsAsyncAction.run(() => super.getListMatchIds(puuid));
  }

  late final _$getMatchByIdAsyncAction =
      AsyncAction('_SummonerStoreBase.getMatchById', context: context);

  @override
  Future<void> getMatchById() {
    return _$getMatchByIdAsyncAction.run(() => super.getMatchById());
  }

  late final _$_SummonerStoreBaseActionController =
      ActionController(name: '_SummonerStoreBase', context: context);

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_SummonerStoreBaseActionController.startAction(
        name: '_SummonerStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SummonerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsError(bool value) {
    final _$actionInfo = _$_SummonerStoreBaseActionController.startAction(
        name: '_SummonerStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_SummonerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
summonerByName: ${summonerByName},
summonerByPuuid: ${summonerByPuuid},
entriesInfo: ${entriesInfo},
rankedChallengerSoloQInfo: ${rankedChallengerSoloQInfo},
match: ${match},
totalMasteryPoints: ${totalMasteryPoints},
championsMastery: ${championsMastery},
matchIds: ${matchIds}
    ''';
  }
}
