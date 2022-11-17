// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teemo_professor/app/modules/scoreboard/service/scoreboard_service.dart';
import 'package:teemo_professor/libraries/common/models/ranked.model.dart';
part 'scoreboard_store.g.dart';

class ScoreboardStore = _ScoreboardStoreBase with _$ScoreboardStore;

abstract class _ScoreboardStoreBase with Store {
  final ScoreboardService service = Modular.get();

  @observable
  bool isLoading = false;

  @action
  setIsLoading(bool value) => isLoading = value;

  @observable
  bool isError = false;

  @action
  setIsError(bool value) => isError = value;

  @observable
  RankedModel? rankedChallengerSoloQInfo;

  @action
  Future<void> getRankedChallengerSoloQInfo() async {
    try {
      setIsLoading(true);
      setIsError(false);
      rankedChallengerSoloQInfo = RankedModel();
      rankedChallengerSoloQInfo = await service.getRankedChallengerSoloQInfo();
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}
