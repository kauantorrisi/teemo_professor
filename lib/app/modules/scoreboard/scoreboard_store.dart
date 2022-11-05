// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'scoreboard_store.g.dart';

class ScoreboardStore = _ScoreboardStoreBase with _$ScoreboardStore;

abstract class _ScoreboardStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
