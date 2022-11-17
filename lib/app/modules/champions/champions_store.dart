// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/cupertino.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:teemo_professor/app/modules/champions/service/champion_service.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';
import 'package:teemo_professor/libraries/common/models/image.model.dart';
part 'champions_store.g.dart';

class ChampionsStore = _ChampionsStoreBase with _$ChampionsStore;

abstract class _ChampionsStoreBase with Store {
  final ChampionsService _championsListService = Modular.get();

  final TextEditingController searchController = TextEditingController();

  @observable
  ChampionModel? champion;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableList<ChampionModel> champions = ObservableList<ChampionModel>();

  @observable
  ObservableList<ChampionModel> researchedChampions =
      ObservableList<ChampionModel>();

  @observable
  ObservableList<ImageModel> squareImages = ObservableList<ImageModel>();

  @action
  void toggleIsSearching() {
    isSearching = !isSearching;
  }

  @action
  bool setIsLoading(bool value) => isLoading = value;

  @action
  bool setIsError(bool value) => isError = value;

  @action
  Future<void> fetchChampionsList() async {
    try {
      setIsLoading(true);
      setIsError(false);
      if (champions.isEmpty) {
        champions.addAll(await _championsListService.fetchChampions());
      }
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> getChampion({required String id}) async {
    try {
      setIsLoading(true);
      setIsError(false);
      champion = await _championsListService.getChampion(id: id);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  List<ChampionModel> searchChampion(String searchControllerText) {
    researchedChampions = ObservableList<ChampionModel>();
    researchedChampions.addAll(
      champions
          .where((champion) => champion.name!.toLowerCase().contains(
                searchControllerText.toLowerCase(),
              ))
          .toList(),
    );
    return researchedChampions;
  }

  List<ChampionModel> loadingChampionsListWhenSearching() {
    researchedChampions = champions;
    return researchedChampions;
  }
}
