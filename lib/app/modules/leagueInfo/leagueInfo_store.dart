import 'package:mobx/mobx.dart';

part 'leagueInfo_store.g.dart';

class LeagueInfoStore = _LeagueInfoStoreBase with _$LeagueInfoStore;
abstract class _LeagueInfoStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}