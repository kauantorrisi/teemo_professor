// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  late final _$rankTypeValueAtom =
      Atom(name: '_HomePageStoreBase.rankTypeValue', context: context);

  @override
  ValueNotifier<String> get rankTypeValue {
    _$rankTypeValueAtom.reportRead();
    return super.rankTypeValue;
  }

  @override
  set rankTypeValue(ValueNotifier<String> value) {
    _$rankTypeValueAtom.reportWrite(value, super.rankTypeValue, () {
      super.rankTypeValue = value;
    });
  }

  late final _$rankModeValueAtom =
      Atom(name: '_HomePageStoreBase.rankModeValue', context: context);

  @override
  ValueNotifier<String> get rankModeValue {
    _$rankModeValueAtom.reportRead();
    return super.rankModeValue;
  }

  @override
  set rankModeValue(ValueNotifier<String> value) {
    _$rankModeValueAtom.reportWrite(value, super.rankModeValue, () {
      super.rankModeValue = value;
    });
  }

  late final _$rankEloValueAtom =
      Atom(name: '_HomePageStoreBase.rankEloValue', context: context);

  @override
  ValueNotifier<String> get rankEloValue {
    _$rankEloValueAtom.reportRead();
    return super.rankEloValue;
  }

  @override
  set rankEloValue(ValueNotifier<String> value) {
    _$rankEloValueAtom.reportWrite(value, super.rankEloValue, () {
      super.rankEloValue = value;
    });
  }

  late final _$rankTierValueAtom =
      Atom(name: '_HomePageStoreBase.rankTierValue', context: context);

  @override
  ValueNotifier<String> get rankTierValue {
    _$rankTierValueAtom.reportRead();
    return super.rankTierValue;
  }

  @override
  set rankTierValue(ValueNotifier<String> value) {
    _$rankTierValueAtom.reportWrite(value, super.rankTierValue, () {
      super.rankTierValue = value;
    });
  }

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

  late final _$isLoadingListAtom =
      Atom(name: '_HomePageStoreBase.isLoadingList', context: context);

  @override
  bool? get isLoadingList {
    _$isLoadingListAtom.reportRead();
    return super.isLoadingList;
  }

  @override
  set isLoadingList(bool? value) {
    _$isLoadingListAtom.reportWrite(value, super.isLoadingList, () {
      super.isLoadingList = value;
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

  late final _$selectedSoloQAtom =
      Atom(name: '_HomePageStoreBase.selectedSoloQ', context: context);

  @override
  bool get selectedSoloQ {
    _$selectedSoloQAtom.reportRead();
    return super.selectedSoloQ;
  }

  @override
  set selectedSoloQ(bool value) {
    _$selectedSoloQAtom.reportWrite(value, super.selectedSoloQ, () {
      super.selectedSoloQ = value;
    });
  }

  late final _$selectedChallengerAtom =
      Atom(name: '_HomePageStoreBase.selectedChallenger', context: context);

  @override
  bool get selectedChallenger {
    _$selectedChallengerAtom.reportRead();
    return super.selectedChallenger;
  }

  @override
  set selectedChallenger(bool value) {
    _$selectedChallengerAtom.reportWrite(value, super.selectedChallenger, () {
      super.selectedChallenger = value;
    });
  }

  late final _$selectedGrandMasterAtom =
      Atom(name: '_HomePageStoreBase.selectedGrandMaster', context: context);

  @override
  bool get selectedGrandMaster {
    _$selectedGrandMasterAtom.reportRead();
    return super.selectedGrandMaster;
  }

  @override
  set selectedGrandMaster(bool value) {
    _$selectedGrandMasterAtom.reportWrite(value, super.selectedGrandMaster, () {
      super.selectedGrandMaster = value;
    });
  }

  late final _$selectedMasterAtom =
      Atom(name: '_HomePageStoreBase.selectedMaster', context: context);

  @override
  bool get selectedMaster {
    _$selectedMasterAtom.reportRead();
    return super.selectedMaster;
  }

  @override
  set selectedMaster(bool value) {
    _$selectedMasterAtom.reportWrite(value, super.selectedMaster, () {
      super.selectedMaster = value;
    });
  }

  late final _$selectedEloAtom =
      Atom(name: '_HomePageStoreBase.selectedElo', context: context);

  @override
  String? get selectedElo {
    _$selectedEloAtom.reportRead();
    return super.selectedElo;
  }

  @override
  set selectedElo(String? value) {
    _$selectedEloAtom.reportWrite(value, super.selectedElo, () {
      super.selectedElo = value;
    });
  }

  late final _$selectedTierAtom =
      Atom(name: '_HomePageStoreBase.selectedTier', context: context);

  @override
  String? get selectedTier {
    _$selectedTierAtom.reportRead();
    return super.selectedTier;
  }

  @override
  set selectedTier(String? value) {
    _$selectedTierAtom.reportWrite(value, super.selectedTier, () {
      super.selectedTier = value;
    });
  }

  late final _$tappedInSummonerRankedInfoButtonAtom = Atom(
      name: '_HomePageStoreBase.tappedInSummonerRankedInfoButton',
      context: context);

  @override
  bool get tappedInSummonerRankedInfoButton {
    _$tappedInSummonerRankedInfoButtonAtom.reportRead();
    return super.tappedInSummonerRankedInfoButton;
  }

  @override
  set tappedInSummonerRankedInfoButton(bool value) {
    _$tappedInSummonerRankedInfoButtonAtom
        .reportWrite(value, super.tappedInSummonerRankedInfoButton, () {
      super.tappedInSummonerRankedInfoButton = value;
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

  late final _$rankedModelAtom =
      Atom(name: '_HomePageStoreBase.rankedModel', context: context);

  @override
  RankedModel? get rankedModel {
    _$rankedModelAtom.reportRead();
    return super.rankedModel;
  }

  @override
  set rankedModel(RankedModel? value) {
    _$rankedModelAtom.reportWrite(value, super.rankedModel, () {
      super.rankedModel = value;
    });
  }

  late final _$summonersEntriesInfoAtom =
      Atom(name: '_HomePageStoreBase.summonersEntriesInfo', context: context);

  @override
  ObservableList<EntryModel?> get summonersEntriesInfo {
    _$summonersEntriesInfoAtom.reportRead();
    return super.summonersEntriesInfo;
  }

  @override
  set summonersEntriesInfo(ObservableList<EntryModel?> value) {
    _$summonersEntriesInfoAtom.reportWrite(value, super.summonersEntriesInfo,
        () {
      super.summonersEntriesInfo = value;
    });
  }

  late final _$diamondToIronEntriesInfoAtom = Atom(
      name: '_HomePageStoreBase.diamondToIronEntriesInfo', context: context);

  @override
  ObservableList<EntryModel?> get diamondToIronEntriesInfo {
    _$diamondToIronEntriesInfoAtom.reportRead();
    return super.diamondToIronEntriesInfo;
  }

  @override
  set diamondToIronEntriesInfo(ObservableList<EntryModel?> value) {
    _$diamondToIronEntriesInfoAtom
        .reportWrite(value, super.diamondToIronEntriesInfo, () {
      super.diamondToIronEntriesInfo = value;
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

  late final _$recentSummonersAtom =
      Atom(name: '_HomePageStoreBase.recentSummoners', context: context);

  @override
  ObservableList<SummonerModel?> get recentSummoners {
    _$recentSummonersAtom.reportRead();
    return super.recentSummoners;
  }

  @override
  set recentSummoners(ObservableList<SummonerModel?> value) {
    _$recentSummonersAtom.reportWrite(value, super.recentSummoners, () {
      super.recentSummoners = value;
    });
  }

  late final _$recentSummonersEntriesListAtom = Atom(
      name: '_HomePageStoreBase.recentSummonersEntriesList', context: context);

  @override
  ObservableList<EntryModel?> get recentSummonersEntriesList {
    _$recentSummonersEntriesListAtom.reportRead();
    return super.recentSummonersEntriesList;
  }

  @override
  set recentSummonersEntriesList(ObservableList<EntryModel?> value) {
    _$recentSummonersEntriesListAtom
        .reportWrite(value, super.recentSummonersEntriesList, () {
      super.recentSummonersEntriesList = value;
    });
  }

  late final _$onSearchAsyncAction =
      AsyncAction('_HomePageStoreBase.onSearch', context: context);

  @override
  Future<void> onSearch() {
    return _$onSearchAsyncAction.run(() => super.onSearch());
  }

  late final _$onTapInRecentSummonerAsyncAction =
      AsyncAction('_HomePageStoreBase.onTapInRecentSummoner', context: context);

  @override
  Future<void> onTapInRecentSummoner(int index) {
    return _$onTapInRecentSummonerAsyncAction
        .run(() => super.onTapInRecentSummoner(index));
  }

  late final _$getSummonerByNameAsyncAction =
      AsyncAction('_HomePageStoreBase.getSummonerByName', context: context);

  @override
  Future<void> getSummonerByName(String? summonerName) {
    return _$getSummonerByNameAsyncAction
        .run(() => super.getSummonerByName(summonerName));
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

  late final _$getRankedChallengerFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedChallengerFlexInfo',
      context: context);

  @override
  Future<void> getRankedChallengerFlexInfo() {
    return _$getRankedChallengerFlexInfoAsyncAction
        .run(() => super.getRankedChallengerFlexInfo());
  }

  late final _$getRankedGrandmasterSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedGrandmasterSoloQInfo',
      context: context);

  @override
  Future<void> getRankedGrandmasterSoloQInfo() {
    return _$getRankedGrandmasterSoloQInfoAsyncAction
        .run(() => super.getRankedGrandmasterSoloQInfo());
  }

  late final _$getRankedGrandmasterFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedGrandmasterFlexInfo',
      context: context);

  @override
  Future<void> getRankedGrandmasterFlexInfo() {
    return _$getRankedGrandmasterFlexInfoAsyncAction
        .run(() => super.getRankedGrandmasterFlexInfo());
  }

  late final _$getRankedMasterSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedMasterSoloQInfo',
      context: context);

  @override
  Future<void> getRankedMasterSoloQInfo() {
    return _$getRankedMasterSoloQInfoAsyncAction
        .run(() => super.getRankedMasterSoloQInfo());
  }

  late final _$getRankedMasterFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedMasterFlexInfo',
      context: context);

  @override
  Future<void> getRankedMasterFlexInfo() {
    return _$getRankedMasterFlexInfoAsyncAction
        .run(() => super.getRankedMasterFlexInfo());
  }

  late final _$getRankedDiamondSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedDiamondSoloQInfo',
      context: context);

  @override
  Future<void> getRankedDiamondSoloQInfo({required String? tier}) {
    return _$getRankedDiamondSoloQInfoAsyncAction
        .run(() => super.getRankedDiamondSoloQInfo(tier: tier));
  }

  late final _$getRankedDiamondFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedDiamondFlexInfo',
      context: context);

  @override
  Future<void> getRankedDiamondFlexInfo({required String? tier}) {
    return _$getRankedDiamondFlexInfoAsyncAction
        .run(() => super.getRankedDiamondFlexInfo(tier: tier));
  }

  late final _$getRankedPlatinumSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedPlatinumSoloQInfo',
      context: context);

  @override
  Future<void> getRankedPlatinumSoloQInfo({required String? tier}) {
    return _$getRankedPlatinumSoloQInfoAsyncAction
        .run(() => super.getRankedPlatinumSoloQInfo(tier: tier));
  }

  late final _$getRankedPlatinumFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedPlatinumFlexInfo',
      context: context);

  @override
  Future<void> getRankedPlatinumFlexInfo({required String? tier}) {
    return _$getRankedPlatinumFlexInfoAsyncAction
        .run(() => super.getRankedPlatinumFlexInfo(tier: tier));
  }

  late final _$getRankedGoldSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedGoldSoloQInfo',
      context: context);

  @override
  Future<void> getRankedGoldSoloQInfo({required String? tier}) {
    return _$getRankedGoldSoloQInfoAsyncAction
        .run(() => super.getRankedGoldSoloQInfo(tier: tier));
  }

  late final _$getRankedGoldFlexInfoAsyncAction =
      AsyncAction('_HomePageStoreBase.getRankedGoldFlexInfo', context: context);

  @override
  Future<void> getRankedGoldFlexInfo({required String? tier}) {
    return _$getRankedGoldFlexInfoAsyncAction
        .run(() => super.getRankedGoldFlexInfo(tier: tier));
  }

  late final _$getRankedSilverSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedSilverSoloQInfo',
      context: context);

  @override
  Future<void> getRankedSilverSoloQInfo({required String? tier}) {
    return _$getRankedSilverSoloQInfoAsyncAction
        .run(() => super.getRankedSilverSoloQInfo(tier: tier));
  }

  late final _$getRankedSilverFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedSilverFlexInfo',
      context: context);

  @override
  Future<void> getRankedSilverFlexInfo({required String? tier}) {
    return _$getRankedSilverFlexInfoAsyncAction
        .run(() => super.getRankedSilverFlexInfo(tier: tier));
  }

  late final _$getRankedBronzeSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedBronzeSoloQInfo',
      context: context);

  @override
  Future<void> getRankedBronzeSoloQInfo({required String? tier}) {
    return _$getRankedBronzeSoloQInfoAsyncAction
        .run(() => super.getRankedBronzeSoloQInfo(tier: tier));
  }

  late final _$getRankedBronzeFlexInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedBronzeFlexInfo',
      context: context);

  @override
  Future<void> getRankedBronzeFlexInfo({required String? tier}) {
    return _$getRankedBronzeFlexInfoAsyncAction
        .run(() => super.getRankedBronzeFlexInfo(tier: tier));
  }

  late final _$getRankedIronSoloQInfoAsyncAction = AsyncAction(
      '_HomePageStoreBase.getRankedIronSoloQInfo',
      context: context);

  @override
  Future<void> getRankedIronSoloQInfo({required String? tier}) {
    return _$getRankedIronSoloQInfoAsyncAction
        .run(() => super.getRankedIronSoloQInfo(tier: tier));
  }

  late final _$getRankedIronFlexInfoAsyncAction =
      AsyncAction('_HomePageStoreBase.getRankedIronFlexInfo', context: context);

  @override
  Future<void> getRankedIronFlexInfo({required String? tier}) {
    return _$getRankedIronFlexInfoAsyncAction
        .run(() => super.getRankedIronFlexInfo(tier: tier));
  }

  late final _$makeRequestRankedInfoListBasedInUserChoiceAsyncAction =
      AsyncAction(
          '_HomePageStoreBase.makeRequestRankedInfoListBasedInUserChoice',
          context: context);

  @override
  Future<void> makeRequestRankedInfoListBasedInUserChoice() {
    return _$makeRequestRankedInfoListBasedInUserChoiceAsyncAction
        .run(() => super.makeRequestRankedInfoListBasedInUserChoice());
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
  bool setIsLoadingList(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setIsLoadingList');
    try {
      return super.setIsLoadingList(value);
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
  bool setSelectedSoloQ(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedSoloQ');
    try {
      return super.setSelectedSoloQ(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setSelectedChallenger(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedChallenger');
    try {
      return super.setSelectedChallenger(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setSelectedGrandMaster(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedGrandMaster');
    try {
      return super.setSelectedGrandMaster(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setSelectedMaster(bool value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedMaster');
    try {
      return super.setSelectedMaster(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? setSelectedLeague(String? value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setSelectedLeague');
    try {
      return super.setSelectedLeague(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool toggleTappedInSummonerRankedInfoButton() {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.toggleTappedInSummonerRankedInfoButton');
    try {
      return super.toggleTappedInSummonerRankedInfoButton();
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isMe() {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.isMe');
    try {
      return super.isMe();
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRecentSummoner(
      SummonerModel? summoner, EntryModel? summonerEntries) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.removeRecentSummoner');
    try {
      return super.removeRecentSummoner(summoner, summonerEntries);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rankTypeValue: ${rankTypeValue},
rankModeValue: ${rankModeValue},
rankEloValue: ${rankEloValue},
rankTierValue: ${rankTierValue},
isLoading: ${isLoading},
isLoadingList: ${isLoadingList},
isError: ${isError},
isMySpell: ${isMySpell},
isMySecondSpell: ${isMySecondSpell},
selectedBestPlayers: ${selectedBestPlayers},
selectedSoloQ: ${selectedSoloQ},
selectedChallenger: ${selectedChallenger},
selectedGrandMaster: ${selectedGrandMaster},
selectedMaster: ${selectedMaster},
selectedElo: ${selectedElo},
selectedTier: ${selectedTier},
tappedInSummonerRankedInfoButton: ${tappedInSummonerRankedInfoButton},
summonerByName: ${summonerByName},
match: ${match},
rankedModel: ${rankedModel},
summonersEntriesInfo: ${summonersEntriesInfo},
diamondToIronEntriesInfo: ${diamondToIronEntriesInfo},
me: ${me},
summonerSpellId: ${summonerSpellId},
summonerSpellId2: ${summonerSpellId2},
championsMastery: ${championsMastery},
matchIds: ${matchIds},
matchs: ${matchs},
champions: ${champions},
spells: ${spells},
recentSummoners: ${recentSummoners},
recentSummonersEntriesList: ${recentSummonersEntriesList}
    ''';
  }
}
