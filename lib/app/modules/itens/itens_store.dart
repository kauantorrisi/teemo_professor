// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'itens_store.g.dart';

class ItensStore = _ItensStoreBase with _$ItensStore;

abstract class _ItensStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
