import 'package:mobx/mobx.dart';

part 'itensList_store.g.dart';

class ItensListStore = _ItensListStoreBase with _$ItensListStore;
abstract class _ItensListStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}