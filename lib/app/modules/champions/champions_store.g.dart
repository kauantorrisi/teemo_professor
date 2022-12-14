// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChampionsStore on _ChampionsStoreBase, Store {
  late final _$championAtom =
      Atom(name: '_ChampionsStoreBase.champion', context: context);

  @override
  ChampionModel? get champion {
    _$championAtom.reportRead();
    return super.champion;
  }

  @override
  set champion(ChampionModel? value) {
    _$championAtom.reportWrite(value, super.champion, () {
      super.champion = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChampionsStoreBase.isLoading', context: context);

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
      Atom(name: '_ChampionsStoreBase.isError', context: context);

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

  late final _$isSearchingAtom =
      Atom(name: '_ChampionsStoreBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$championsAtom =
      Atom(name: '_ChampionsStoreBase.champions', context: context);

  @override
  ObservableList<ChampionModel> get champions {
    _$championsAtom.reportRead();
    return super.champions;
  }

  @override
  set champions(ObservableList<ChampionModel> value) {
    _$championsAtom.reportWrite(value, super.champions, () {
      super.champions = value;
    });
  }

  late final _$researchedChampionsAtom =
      Atom(name: '_ChampionsStoreBase.researchedChampions', context: context);

  @override
  ObservableList<ChampionModel> get researchedChampions {
    _$researchedChampionsAtom.reportRead();
    return super.researchedChampions;
  }

  @override
  set researchedChampions(ObservableList<ChampionModel> value) {
    _$researchedChampionsAtom.reportWrite(value, super.researchedChampions, () {
      super.researchedChampions = value;
    });
  }

  late final _$squareImagesAtom =
      Atom(name: '_ChampionsStoreBase.squareImages', context: context);

  @override
  ObservableList<ImageModel> get squareImages {
    _$squareImagesAtom.reportRead();
    return super.squareImages;
  }

  @override
  set squareImages(ObservableList<ImageModel> value) {
    _$squareImagesAtom.reportWrite(value, super.squareImages, () {
      super.squareImages = value;
    });
  }

  late final _$fetchChampionsListAsyncAction =
      AsyncAction('_ChampionsStoreBase.fetchChampionsList', context: context);

  @override
  Future<void> fetchChampionsList() {
    return _$fetchChampionsListAsyncAction
        .run(() => super.fetchChampionsList());
  }

  late final _$getChampionAsyncAction =
      AsyncAction('_ChampionsStoreBase.getChampion', context: context);

  @override
  Future<void> getChampion({required String id}) {
    return _$getChampionAsyncAction.run(() => super.getChampion(id: id));
  }

  late final _$_ChampionsStoreBaseActionController =
      ActionController(name: '_ChampionsStoreBase', context: context);

  @override
  void toggleIsSearching() {
    final _$actionInfo = _$_ChampionsStoreBaseActionController.startAction(
        name: '_ChampionsStoreBase.toggleIsSearching');
    try {
      return super.toggleIsSearching();
    } finally {
      _$_ChampionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsLoading(bool value) {
    final _$actionInfo = _$_ChampionsStoreBaseActionController.startAction(
        name: '_ChampionsStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_ChampionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setIsError(bool value) {
    final _$actionInfo = _$_ChampionsStoreBaseActionController.startAction(
        name: '_ChampionsStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_ChampionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
champion: ${champion},
isLoading: ${isLoading},
isError: ${isError},
isSearching: ${isSearching},
champions: ${champions},
researchedChampions: ${researchedChampions},
squareImages: ${squareImages}
    ''';
  }
}
